return {
    {
        "NachoNievaG/atac.nvim",
        dependencies = { "akinsho/toggleterm.nvim" },
        config = function()
            require("atac").setup {
                dir = "~/.local/share/atac",
            }
        end,
    },
    {
        "AstroNvim/astrocore",
        opts = {
            mappings = {
                n = {
                    ["<Leader>ta"] = { ":Atac<CR>", desc = "ATAC HTTP client" },
                },
            },
        },
    },
}
