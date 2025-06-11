return {
  {
    "AstroNvim/astrocore",
    optional = true,
    opts = {
      diagnostics = {
        virtual_text = false,
        virtual_lines = false,
        float = {
          enabled = true,
        },
        jump = {
          float = false,
        },
      },
    },
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    opts = {
      options = {
        show_source = true,
        multilines = {
          -- Enable multiline diagnostic messages
          enabled = true,
          -- Always show messages on all lines for multiline diagnostics
          always_show = true,
        },
        break_line = {
          -- Enable the feature to break messages after a specific length
          enabled = false,
          -- Number of characters after which to break the line
          after = 30,
        },
      },
    },
  },
}
