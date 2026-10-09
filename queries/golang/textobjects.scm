; functions
([
  (function_declaration
    body: (block
      .
      "{"
      _+ @function.inner
      "}"))
  (method_declaration
    body: (block
      .
      "{"
      _+ @function.inner
      "}"))
  (function_literal
    body: (block
      .
      "{"
      _+ @function.inner
      "}"))
])

[
  (function_declaration)
  (method_declaration)
  (function_literal)
] @function.outer

; struct and interface declarations as class
(type_declaration
  (type_definition
    type: (struct_type
      "{"
      _+ @class.inner
      "}"))) @class.outer

(type_declaration
  (type_definition
    type: (interface_type
      "{"
      _+ @class.inner
      "}"))) @class.outer

; composite literals as class
(composite_literal
  value: (literal_value
    "{"
    _+ @class.inner
    "}")) @class.outer

; conditionals
(if_statement) @conditional.outer

(if_statement
  condition: (_) @conditional.inner)

(if_statement
  body: (block) @conditional.inner)

(if_statement
  else: (_) @conditional.inner)

[
  (expression_switch_statement)
  (type_switch_statement)
  (select_statement)
] @conditional.outer

; loops
(for_statement
  body: (block) @loop.inner) @loop.outer

; blocks
(_
  (block) @block.inner) @block.outer

; statements
(block
  (_) @statement.outer)

; comments
(comment) @comment.outer

; calls
(call_expression) @call.outer

(call_expression
  arguments: (arguments
    .
    "("
    _+ @call.inner
    ")"))

; parameters
(parameters
  "," @parameter.outer
  .
  (parameter_declaration) @parameter.inner @parameter.outer)

(parameters
  .
  (parameter_declaration) @parameter.inner @parameter.outer
  .
  ","? @parameter.outer)

; arguments
(arguments
  "," @parameter.outer
  .
  (_) @parameter.inner @parameter.outer)

(arguments
  .
  (_) @parameter.inner @parameter.outer
  .
  ","? @parameter.outer)

; assignments
(short_var_declaration
  left: (_) @assignment.lhs
  right: (_) @assignment.rhs @assignment.inner) @assignment.outer

(assignment
  left: (_) @assignment.lhs
  right: (_) @assignment.rhs @assignment.inner) @assignment.outer

(var_spec
  name: (_) @assignment.lhs
  value: (_) @assignment.rhs @assignment.inner) @assignment.outer

(const_spec
  name: (_) @assignment.lhs
  value: (_) @assignment.rhs @assignment.inner) @assignment.outer
