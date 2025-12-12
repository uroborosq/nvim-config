return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>e"] = { ":Neotree filesystem float reveal toggle<CR>" },
          ["<Leader>o"] = { ":Neotree filesystem float reveal toggle<CR>" },
          ["<Leader>E"] = { ":Neotree filesystem left reveal toggle<CR>" },
        },
      },
    },
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- Uncomment whichever supported plugin(s) you use
      -- "nvim-tree/nvim-tree.lua",
      "nvim-neo-tree/neo-tree.nvim",
      -- "simonmclean/triptych.nvim"
    },
    config = function() require("lsp-file-operations").setup() end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          never_show = { ".git", ".vscode", ".idea" },
        },
      },
    },
  },
}
