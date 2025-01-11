return {
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            opts.sources = {
                { name = "nvim_lsp", group_index = 1 },
                { name = "buffer", group_index = 2 },
            }

            opts.sorting = {
                comparators = {
                    require("cmp.config.compare").sort_text,
                },
            }
        end,
    },
    -- Tabby settings
    {
        "AstroNvim/astrocore",
        opts = {
            options = {
                g = {
                    tabby_inline_completion_keybinding_accept = "<C-L>",
                },
            },
        },
    },
}
