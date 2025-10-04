return {
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
    {
      "rebelot/kanagawa.nvim",
      opts = {
        compile = true, -- enable compiling the colorscheme
        typeStyle = { bold = true },
      },
    },

    { import = "astrocommunity.colorscheme.tokyodark-nvim" },

    { import = "astrocommunity.colorscheme.vscode-nvim" },
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
    {
      "AstroNvim/astrocore",
      ---@type AstroCoreOpts
      opts = {
        options = {
          opt = { -- configure vim.opt options
            -- configure font
            guifont = "Adwaita Mono:h12",
            -- line spacing
            linespace = 3,
          },
          g = { -- configure vim.g variables
            -- configure scaling
            -- neovide_scale_factor = 1.0,
            -- configure padding
            -- neovide_padding_top = 0,
            -- neovide_padding_bottom = 0,
            -- neovide_padding_right = 0,
            -- neovide_padding_left = 0,
            neovide_cursor_animation_length = 0.03,
            -- neovide_transpareny = 0,
            -- transparency = 0,
          },
        },
      },
    },
  },
}
