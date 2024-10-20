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
            -- opts.mapping["<C-j>"] = cmp.mapping.select_next_item()
            -- opts.mapping["<C-k>"] = cmp.mapping.select_prev_item()
            -- opts.mapping["<C-j>"] = opts.mapping["<Tab>"]
            -- opts.mapping["<Tab>"] = nil
        end,
    },
    -- Tabby settings
    {
        "AstroNvim/astrocore",
        opts = {
            options = {
                g = {
                    tabby_keybinding_accept = "<Tab>",
                },
            },
        },
    },
}
