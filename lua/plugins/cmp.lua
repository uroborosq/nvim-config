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
            -- opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
            -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
            -- if cmp.visible() then
            -- local entry = cmp.get_selected_entry()
            -- if not entry then cmp.select_next_item { behavior = cmp.SelectBehavior.Select } end
            -- cmp.confirm()
            -- else
            -- fallback()
            -- end
            -- end, { "i", "s", "c" })
        end,
    },
    -- Tabby settings
    {
        "AstroNvim/astrocore",
        opts = {
            options = {
                g = {
                    tabby_keybinding_accept = "<C-I>",
                },
            },
        },
    },
}
