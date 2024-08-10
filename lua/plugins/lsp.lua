return {
    {
        "AstroNvim/astrolsp",
        optional = true,
        ---@type AstroLSPOpts
        opts = {
            ---@diagnostic disable-next-line: missing-fields
            config = {
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
                            -- hints = {
                            --     assignVariableTypes = true,
                            --     compositeLiteralFields = true,
                            --     compositeLiteralTypes = true,
                            --     constantValues = true,
                            --     functionTypeParameters = true,
                            --     parameterNames = true,
                            --     rangeVariableTypes = true,
                            -- },
                            buildFlags = { "-tags", "integration" },
                            symbolMatcher = "Fuzzy",
                            completeUnimported = true,
                            diagnosticsDelay = "50ms",
                            staticcheck = true,
                            usePlaceholders = false,
                            vulncheck = "Imports",
                        },
                    },
                },
            },
        },
    },
}
