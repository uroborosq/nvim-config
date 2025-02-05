return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            {
                "fredrikaverpil/neotest-golang",
                commit = "09b29c40d7c87a39cde73606d54cc1ed4ffc7e08",
            },
        },
        config = function()
            local config = {
                runner = "gotestsum",
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
                    -- Drastically improve performance in ginormous projects by
                    -- only AST-parsing the currently opened buffer.
                    enabled = false,
                    -- Number of workers to parse files concurrently.
                    -- A value of 0 automatically assigns number based on CPU.
                    -- Set to 1 if experiencing lag.
                    concurrent = 0,
                },
                running = {
                    -- Run tests concurrently when an adapter provides multiple commands to run.
                    concurrent = true,
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
}
