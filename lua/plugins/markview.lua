return {
  {
    -- For `plugins/markview.lua` users.
    "OXY2DEV/markview.nvim",
    lazy = false,

    -- Completion for `blink.cmp`
    -- dependencies = { "saghen/blink.cmp" },

    opts = {
      markdown = {
        enabled = false,
      },
      markdown_inline = {
        enabled = false,
      },
      preview = {
        enabled = true,
        splitview_winopts = {
          split = "right",
        },
      },
    },
  },
}
