return {
  {
    "stevearc/aerial.nvim",
    opts = {
      backends = {
        go = { "treesitter" },
      },
      layout = {
        default_direction = "prefer_left",
        placement = "edge",
        resize_to_content = false,
        preserve_equality = true,
        max_width = nil,
        width = nil,
        min_width = nil,
      },
    },
  },
}
