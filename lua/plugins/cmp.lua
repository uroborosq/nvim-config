return {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
        local cmp = require "cmp"
        opts.sources = cmp.config.sources {
            { name = "nvim_lsp", priority = 2 },
            { name = "buffer", priority = 1 },
        }

        opts.sorting = {
            comparators = {
                cmp.config.compare.locality,
            },
        }
    end,
}
