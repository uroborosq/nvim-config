return {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
        local cmp = require "cmp"
        opts.sources = cmp.config.sources {
            { name = "luasnip" },
            { name = "nvim_lsp" },
        }

        opts.sorting = {
            comparators = {},
        }
    end,
}
