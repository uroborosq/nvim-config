return {
  "AstroNvim/astrocore",
  opts = {
    options = {
      opt = {                   -- vim.opt.<key>
        relativenumber = false, -- sets vim.opt.relativenumber
        number = true,          -- sets vim.opt.number
        spell = false,          -- sets vim.opt.spell
        signcolumn = "auto",    -- sets vim.opt.signcolumn to auto
        wrap = false,
        tabstop = 4,
        shiftwidth = 4,
        softtabstop = 4,
        expandtab = true,
      },
    },
  },
  features = {
    autopairs = true,     -- enable or disable autopairs on start
    cmp = true,
    diagnostics_mode = 2, -- diagstic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = off)
    highlighturl = true,  -- enable or disable highlighting of urls on start
    -- table for defining the size of the max file for all features, above these limits we disable features like treesitter.
    large_buf = { size = 1024 * 100, lines = 10000 },
    notifications = true, -- enable or disable notifications on start
  },
}
