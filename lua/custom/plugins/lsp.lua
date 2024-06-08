return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        lspconfig.gopls.setup {
            cmd = { "gopls" },
            filetypes = { "go", "gomod", "gowork", "gotmpl" },
            settings = {
                gopls = {
                    analyses = {
                        ST1003 = true,
                        fieldalignment = false,
                        fillreturns = true,
                        nilness = true,
                        nonewvars = true,
                        shadow = true,
                        undeclaredname = true,
                        unreachable = true,
                        unusedparams = true,
                        unusedwrite = true,
                        useany = true,
                    },
                    codelenses = {
                        gc_details = true, -- Show a code lens toggling the display of gc's choices.
                        generate = true, -- show the `go generate` lens.
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
                    diagnosticsDelay = "50ms",
                    matcher = "Fuzzy",
                    semanticTokens = true,
                    staticcheck = true,
                    symbolMatcher = "fuzzy",
                    usePlaceholders = false,
                },
            },
        }
    end
}
