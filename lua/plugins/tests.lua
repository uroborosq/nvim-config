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
                    concurrent = 0,
                },
                running = {
                    concurrent = true,
                },
                adapters = {
                    require "neotest-golang"(config), -- Apply configuration
                },
            }
        end,
    },
}
