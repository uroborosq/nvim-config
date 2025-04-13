local ls = require "luasnip"
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["gD"] = {
            function() require("dropbar.api").pick() end,
            desc = "Go to dropbar",
          },
          ["<Leader>bF"] = {
            require("telescope.builtin").filetypes,
            desc = "Set filetype for buffer",
          },
          ["<Leader>gm"] = { ":DiffviewOpen main<CR>", desc = "Show diff with main" },
          ["<Leader>gD"] = { ":DiffviewOpen HEAD<CR>", desc = "Show diff with HEAD" },
          ["<C-W>t"] = { ":tabclose<CR>", desc = "Close current tab" },
        },
        v = {
          ["<Leader>r"] = { ":SnipRun<CR>", desc = "Run selected with SnipRun" },
        },
        i = {
          ["<C-L>"] = { function() ls.expand() end },
          ["<C-N>"] = { function() ls.jump(1) end },
          ["<C-J>"] = { function() ls.jump(-1) end },
        },
      },
    },
  },
}
