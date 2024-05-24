return {
  "ellisonleao/gruvbox.nvim",
  opts = {
    italic = {
      strings = true,
      comments = true,
      folds = true,
      operations = false,
    }
  },

  "sainnhe/everforest",
  "savq/melange-nvim",
  "ramojus/mellifluous.nvim",
  "xero/miasma.nvim",
  "briones-gabriel/darcula-solid.nvim",
  "rktjmp/lush.nvim",
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "                   ▄                    ",
        "                  ▟█▙                  ",
        "                 ▟███▙                 ",
        "                ▟█████▙                ",
        "               ▟███████▙               ",
        "              ▂▔▀▜██████▙              ",
        "             ▟██▅▂▝▜█████▙             ",
        "            ▟█████████████▙            ",
        "           ▟███████████████▙           ",
        "          ▟█████████████████▙          ",
        "         ▟███████████████████▙         ",
        "        ▟█████████▛▀▀▜████████▙        ",
        "       ▟████████▛      ▜███████▙       ",
        "      ▟█████████        ████████▙      ",
        "     ▟██████████        █████▆▅▄▃▂     ",
        "    ▟██████████▛        ▜█████████▙    ",
        "   ▟██████▀▀▀              ▀▀██████▙   ",
        "  ▟███▀▘                       ▝▀███▙  ",
        " ▟▛▀                               ▀▜▙ ",
      }
      return opts
    end,
  },
  ---@type LazySpec
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      colorscheme = "gruvbox",
    },
  }
}
