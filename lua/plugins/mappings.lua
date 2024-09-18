return {
    {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
            mappings = {
                n = {
                    ["gdb"] = {
                        function() require("dropbar.api").pick() end,
                        desc = "Go to dropbar",
                    },
                    ["<Leader>bF"] = {
                        require("telescope.builtin").filetypes,
                        desc = "Set filetype for buffer",
                    },
                },
            },
        },
    },
    -- use <Super>+{h,j,k,l} to switch between windows as in sway
    {
        "https://git.sr.ht/~jcc/vim-sway-nav",
    },
}
