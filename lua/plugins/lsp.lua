return {
    {
        "AstroNvim/astrolsp",
        optional = true,
        ---@type AstroLSPOpts
        opts = {
            ---@diagnostic disable-next-line: missing-fields
            config = {
                -- protols = {
                --     capabilities = {},
                -- },
                gopls = {
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
                            experimentalPostfixCompletions = true,
                            buildFlags = { "-tags", "integration" },
                            symbolMatcher = "Fuzzy",
                            completeUnimported = true,
                            diagnosticsDelay = "50ms",
                            staticcheck = true,
                            usePlaceholders = true,
                            vulncheck = "Imports",
                        },
                    },
                },
            },
            features = {
                signature_help = true,
                inlay_hints = true,
            },
            -- servers = { "protols" },
        },
        {
            "AstroNvim/astrocore",
            ---@type AstroCoreOpts
            opts = {
                mappings = {
                    n = {
                        ["<Leader>lu"] = { ":LspRestart<CR>", desc = "Restart LSP" },
                        ["<Leader>lc"] = {
                            require("telescope.builtin").lsp_incoming_calls,
                            desc = "Incomming calls",
                        },
                        ["<Leader>lC"] = {
                            require("telescope.builtin").lsp_outgoing_calls,
                            desc = "Outgoing calls",
                        },
                        ["<Leader>lg"] = {
                            require("telescope.builtin").lsp_dynamic_workspace_symbols,
                            desc = "Dynamic search for symbols",
                        },
                    },
                },
            },
        },
    },
}
