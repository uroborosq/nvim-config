return {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
        require("rainbow-delimiters.setup").setup {
            highlight = {
                "RainbowDelimiterYellow",
                "RainbowDelimiterBlue",
                "RainbowDelimiterOrange",
                "RainbowDelimiterGreen",
                "RainbowDelimiterViolet",
                "RainbowDelimiterRed",
                "RainbowDelimiterCyan",
            },
        }
    end,
}
