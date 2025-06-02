local prefix = "<Leader>G"
return {
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    build = function()
      if not require("lazy.core.config").spec.plugins["mason.nvim"] then
        vim.print "Installing go dependencies..."
        vim.cmd.GoInstallDeps()
      end
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "williamboman/mason.nvim", optional = true }, -- by default use Mason for go dependencies
    },
    opts = {},
  },
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          [prefix] = { desc = "Golang" },
          [prefix .. "c"] = { ":GoCmt<CR>", desc = "Generate comment" },
          [prefix .. "e"] = { ":GoIfErr<CR>", desc = "Generate if err" },
          [prefix .. "d"] = { ":GoMod tidy<CR>", desc = "go mod tidy" },
          [prefix .. "g"] = { ":GoGenerate %<CR>", desc = "go generate current file" },
          [prefix .. "G"] = { ":GoGenerate<CR>", desc = "go generate all" },
          -- no CR - keep possibility to enter your arguments
          [prefix .. "i"] = { ":GoImpl ", desc = "implement current interface" },
          [prefix .. "a"] = {
            -- ":GoTagAdd json<CR>:GoTagAdd bson -transform camelcase<CR>",
            ":GoTagAdd json<CR>",
            desc = "add tags to struct",
          },
          -- no CR to input module name
          [prefix .. "I"] = { ":GoMod init ", desc = "go mod init" },
          [prefix .. "t"] = { ":GoTestAdd<CR>", desc = "gen tests for cur method" },
          [prefix .. "T"] = { ":GoTestsExp<CR>", desc = "gen tests for exported methods" },
        },
        i = {
          ["<C-E>"] = { "<esc>:GoIfErr<CR>i", desc = "Generate if err" },
        },
      },
    },
  },
}
