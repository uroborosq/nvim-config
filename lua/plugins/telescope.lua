return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
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
