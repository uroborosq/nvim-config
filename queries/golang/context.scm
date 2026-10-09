[
  (var_declaration)
  (type_declaration)
  (import_declaration)
  (const_declaration)
  (select_statement)
  (expression_switch_statement)
  (type_switch_statement)
  (expression_case_clause)
  (type_case_clause)
] @context

(function_declaration
  body: (block
    (_) @context.end)) @context

(function_literal
  body: (block
    (_) @context.end)) @context

(method_declaration
  body: (block
    (_) @context.end)) @context

(if_statement
  body: (block
    (_) @context.end)) @context

(for_statement
  body: (block
    (_) @context.end)) @context

(communication_clause
  communication: (_)
  (_) @context.end) @context

(composite_literal
  value: (literal_value
    (_) @context.end)) @context
