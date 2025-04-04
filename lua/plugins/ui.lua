return { -- selected colorscheme
  -- {
  --     "AstroNvim/astrocore",
  --     opts = { options = { o = { background = "dark" } } },
  -- },
  -- installed colorschemes
  "xiantang/darcula-dark.nvim",
  "rktjmp/lush.nvim",
  {
    "EdenEast/nightfox.nvim",
    opts = {
      options = {
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "bold",
          functions = "bold,italic",
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
    { import = "astrocommunity.colorscheme.dracula-nvim" },
    { import = "astrocommunity.colorscheme.github-nvim-theme" },
    { import = "astrocommunity.colorscheme.gruvbox-nvim" },
    { import = "astrocommunity.colorscheme.hybrid-nvim" },
    { import = "astrocommunity.colorscheme.kanagawa-nvim" },
    { import = "astrocommunity.colorscheme.melange-nvim" },
    { import = "astrocommunity.colorscheme.miasma-nvim" },
    { import = "astrocommunity.colorscheme.tokyodark-nvim" },
    { import = "astrocommunity.colorscheme.vscode-nvim" },
    { import = "astrocommunity.colorscheme.everblush-nvim" },
    { import = "astrocommunity.colorscheme.palenight-nvim" },
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
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>c"] = {
            function()
              local bufs = vim.fn.getbufinfo { buflisted = true }
              require("astrocore.buffer").close(0)
              if not bufs[2] then require("snacks").dashboard() end
            end,
            desc = "Close buffer",
          },
        },
      },
    },
  },
  {
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        options = {
          opt = { -- configure vim.opt options
            -- configure font
            guifont = "Adwaita Mono:h12:#e-subpixelantialias",
            -- line spacing
            -- linespace = 5,
          },
          g = { -- configure vim.g variables
            -- configure scaling
            neovide_scale_factor = 1.0,
            -- configure padding
            neovide_padding_top = 0,
            neovide_padding_bottom = 0,
            neovide_padding_right = 0,
            neovide_padding_left = 0,
            neovide_cursor_animation_length = 0.03,
            neovide_transpareny = 0,
            transparency = 0,
          },
        },
      },
    },
  },
}
