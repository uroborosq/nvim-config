---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- vim options can be configured here
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
      g = {
        autoformat_enabled = true,       -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
        cmp_enabled = true,              -- enable completion at start
        autopairs_enabled = true,        -- enable autopairs at start
        diagnostics_mode = 3~,            -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
        icons_enabled = true,            -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
        resession_enabled = false,       -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
      },
    },
    diagnostics = {
      -- disable diagnostics virtual text
      virtual_text = false,
      update_in_insert = true,
    },
    features = {
      autopairs = true, -- enable or disable autopairs on start
      cmp = true, -- enable or disable cmp on start
      highlighturl = true, -- enable or disable highlighting of urls on start
      -- table for defining the size of the max file for all features, above these limits we disable features like treesitter.
      large_buf = { size = 1024 * 100, lines = 10000 },
      notifications = true, -- enable or disable notifications on start
    },
  },
}
