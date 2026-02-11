local actions = require "telescope.actions"

return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-f>"] = actions.preview_scrolling_left,
            ["<C-b>"] = actions.preview_scrolling_right,
          },
        },
      },
      extensions = {
        ["ui-select"] = {},
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    specs = {
      { "nvim-lua/plenary.nvim", lazy = true },
      { "folke/snacks.nvim", opts = { picker = { enabled = true } } },
    },
  },
}
