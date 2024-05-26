-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "gopls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  -- root_dir = "/home/dmitriy.tikhomirov/desktop/control_path",
  gopls = {
    analyses = {
      ST1003 = true,
      fieldalignment = false,
      fillreturns = true,
      nilness = true,
      nonewvars = true,
      shadow = true,
      undeclaredname = false,
      unreachable = true,
      unusedparams = true,
      unusedwrite = true,
      useany = true,
    },
    codelenses = {
      gc_details = true, -- Show a code lens toggling the display of gc's choices.
      generate = true,   -- show the `go generate` lens.
      regenerate_cgo = true,
      test = true,
      tidy = true,
      upgrade_dependency = true,
      vendor = true,
    },
    hints = {
      assignVariableTypes = true,
      compositeLiteralFields = true,
      compositeLiteralTypes = true,
      constantValues = true,
      functionTypeParameters = true,
      parameterNames = true,
      rangeVariableTypes = true,
    },
    buildFlags = { "-tags", "integration" },
    completeUnimported = true,
    diagnosticsDelay = "500ms",
    matcher = "Fuzzy",
    semanticTokens = true,
    staticcheck = true,
    symbolMatcher = "fuzzy",
    usePlaceholders = true,
  },
}
