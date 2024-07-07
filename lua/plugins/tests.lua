return {
    {
        "fredrikaverpil/neotest-golang",
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "uroborosq/neotest-golang", -- Installation
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
