return {
  {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        -- ["core.completion"] = {
        -- config = {
        -- engine = "nvim-cmp",
        -- },
        -- },
        ["core.summary"] = {},
      },
    },
    specs = {
      {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
          if opts.ensure_installed ~= "all" then
            opts.ensure_installed =
              require("astrocore").list_insert_unique(opts.ensure_installed, { "norg", "norg_meta" })
          end
        end,
      },
    },
  },
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>m"] = { desc = "Neorg" },
          ["<Leader>mm"] = { ":Neorg<CR>", desc = "Neorg menu" },
        },
      },
    },
  },
}
