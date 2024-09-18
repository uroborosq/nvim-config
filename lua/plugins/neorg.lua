return {
    {
        "nvim-neorg/neorg",
        lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        version = "*", -- Pin Neorg to the latest stable release
        opts = {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {}, -- We added this line!
            },
        },
    },
    {
        "AstroNvim/astrocore",
        opts = {
            mappings = {
                n = {
                    ["<Leader>m"] = { desc = "Neorg" },
                    ["<Leader>mm"] = { ":Neorg<CR>", desc = "Neorg menu" },
                },
            },
        },
    },
}
