return {
  "AstroNvim/astrocore",
  opts = {
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = true,
        spelllang = { "en_us", "ru" },
        spelloptions = "camel",
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false,
        tabstop = 4,
        shiftwidth = 4,
        softtabstop = 4,
        laststatus = 3,
        expandtab = true,
        langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯХЪБЮЖфисвуапршолдьтщзйкыегмцчняхъюэ;ABCDEFGHIJKLMNOPQRSTUVWXYZ{}<>:abcdefghijklmnopqrstuvwxyz[]."',
      },
      o = {
        autoread = true,
      },
    },
    features = {
      autopairs = true, -- enable or disable autopairs on start
      cmp = true,
      -- diagnostics_mode = 0, -- diagstic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = off)
      highlighturl = true, -- enable or disable highlighting of urls on start
      -- table for defining the size of the max file for all features, above these limits we disable features like treesitter.
      large_buf = { size = 1024 * 100, lines = 10000 },
      notifications = true, -- enable or disable notifications on start
    },
  },
}
