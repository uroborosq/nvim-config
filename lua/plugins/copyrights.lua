return {
    { "alpertuna/vim-header" },
    {
        "https://git.sr.ht/~reggie/licenses.nvim",
        config = function()
            require("licenses").setup {
                require("telescope").load_extension "licenses-nvim",
            }
        end,
    },
}
