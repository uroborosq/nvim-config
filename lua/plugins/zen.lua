return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    opts.zen.toggles.diagnostics = true
    opts.zen.toggles.inlay_hints = true
    opts.zen.win.wo.relativenumber = true
  end,
}
