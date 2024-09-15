return {
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            local cmp = require "cmp"
            opts.sources = cmp.config.sources {
                { name = "nvim_lsp", priority = 1000000 },
                { name = "buffer", priority = 0 },
            }

            opts.sorting = {
                comparators = {},
            }
            opts.mapping["<C-j>"] = cmp.mapping.select_next_item()
            opts.mapping["<C-k>"] = cmp.mapping.select_prev_item()

            vim.notify(vim.inspect(opts.mapping))
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
