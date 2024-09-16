return {
    "akinsho/toggleterm.nvim",
    opts = {
        direction = "float",
        float_opts = {
            width = function() return math.floor(vim.o.columns * 0.9) end,
            height = function() return math.floor(vim.o.lines * 0.8) end,
        },
        winbar = {
            enabled = true,
            name_formatter = function(term) --  term: Terminal
                return term.name
            end,
        },
    },
}
