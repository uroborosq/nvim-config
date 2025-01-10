return {
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            local cmp = require "cmp"
            opts.sources = cmp.config.sources {
                { name = "nvim_lsp", priority = 1000000 },
                { name = "neorg", priority = -100000 },
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
