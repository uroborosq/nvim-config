return {
    {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
            mappings = {
                n = {
                    ["<Leader>lu"] = { ":LspRestart<CR>", desc = "Restart LSP" },
                    ["<Leader>lc"] = {
                        require("telescope.builtin").lsp_incoming_calls,
                        desc = "Incomming calls",
                    },
                    ["<Leader>lC"] = {
                        require("telescope.builtin").lsp_outgoing_calls,
                        desc = "Outgoing calls",
                    },
                    ["<Leader>lg"] = {
                        require("telescope.builtin").lsp_dynamic_workspace_symbols,
                        desc = "Dynamic search for symbols",
                    },
                    ["<Leader>bF"] = {
                        require("telescope.builtin").filetypes,
                        desc = "Set filetype for buffer",
                    },
                    ["gdb"] = {
                        function() require("dropbar.api").pick() end,
                        desc = "Go to dropbar",
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
