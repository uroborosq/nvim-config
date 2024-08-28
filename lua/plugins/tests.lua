return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "fredrikaverpil/neotest-golang",
            branch = "feat/test-suite-support",
        },
        config = function()
            local config = {
                dap_go_enabled = true,
                testify_enabled = true,
                go_test_args = {
                    "-v",
                    "-count=1",
                    "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
                },
            } -- Specify configuration
            require("neotest").setup {
                discovery = {
                    enabled = true,
                },
                running = {
                    concurrent = false,
                },
                adapters = {
                    require "neotest-golang"(config), -- Apply configuration
                },
            }
        end,
    },
    {
        "andythigpen/nvim-coverage",
        config = function()
            require("coverage").setup {
                auto_reload = true,
            }
        end,
    },
    {
        "AstroNvim/astrocore",
        opts = {
            mappings = {
                n = {
                    ["<Leader>Tc"] = { ":CoverageSummary<CR>", desc = "Show test coverage summary" },
                    ["<Leader>Ts"] = { ":CoverageToggle<CR>", desc = "Toggle coverage highlights" },
                },
            },
        },
    },
}
