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
            require("neotest").setup {
                adapters = {
                    require "neotest-golang", -- Apply configuration
                },
            }
        end,
    },
}
