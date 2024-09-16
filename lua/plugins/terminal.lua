return {
    "akinsho/toggleterm.nvim",
    opts = {
        direction = "float",
        winbar = {
            enabled = true,
            name_formatter = function(term) --  term: Terminal
                return term.name
            end,
        },
    },
}
