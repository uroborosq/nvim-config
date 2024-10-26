return {
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            local cmp = require "cmp"
            opts.sources = cmp.config.sources {
                { name = "nvim_lsp", priority = 1000000 },
                { name = "neorg", priority = 10 },
            }

            opts.sorting = {
                comparators = {},
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
