return { -- selected colorscheme
  -- {
  --     "AstroNvim/astrocore",
  --     opts = { options = { o = { background = "dark" } } },
  -- },
  -- installed colorschemes
  "xiantang/darcula-dark.nvim",
  {
    "EdenEast/nightfox.nvim",
    opts = {
      options = {
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "bold",
          functions = "bold",
          conditionals = "bold",
          constants = "bold,underline",
          numbers = "italic",
          strings = "italic",
          variables = "",
          operators = "",
          preprocs = "",
        },
      },
    },
  },
  {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.colorscheme.bamboo-nvim" },
    { import = "astrocommunity.colorscheme.catppuccin" },
    { import = "astrocommunity.colorscheme.everforest" },
    { import = "astrocommunity.colorscheme.gruvbox-nvim" },
    { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      dashboard = {
        preset = {
          header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

                             Talk is cheap. Show me the code
                                            - Linus Torvalds
          ]],
        },
      },
    },
  },
}
