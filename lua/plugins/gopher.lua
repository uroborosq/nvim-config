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
          ["<leader>lF"] = {
            function()
              vim.cmd "write"
              local file = vim.fn.expand "%:p"
              local cmd = { "golangci-lint", "run", "--fix", file }
              vim.fn.jobstart(cmd, {
                stdout_buffered = true,
                stderr_buffered = true,
                on_stdout = function(_, data) end,
                on_stderr = function(_, data)
                  if data and #data > 1 then vim.notify(table.concat(data, "\n"), vim.log.levels.WARN) end
                end,
                on_exit = function(_, code)
                  if code == 0 or code == 1 then
                    -- 0 = clean, 1 = issues found (often still fixed what it could)
                    vim.cmd "checktime"
                    vim.notify("golangci-lint --fix done (exit " .. code .. ")")
                  else
                    vim.notify("golangci-lint failed (exit " .. code .. ")", vim.log.levels.ERROR)
                  end
                end,
              })
            end,
            desc = "golangci-lint --fix current file",
          },
          [prefix] = { desc = "Golang" },
          [prefix .. "c"] = { ":GoCmt<CR>", desc = "Generate comment" },
          [prefix .. "e"] = { ":GoIfErr<CR>", desc = "Generate if err" },
          [prefix .. "d"] = { ":GoMod tidy<CR>", desc = "go mod tidy" },
          [prefix .. "g"] = { ":GoGenerate %<CR>", desc = "go generate current file" },
          [prefix .. "G"] = { ":GoGenerate<CR>", desc = "go generate all" },
          -- no CR - keep possibility to enter your arguments
          [prefix .. "i"] = { ":GoImpl ", desc = "implement current interface" },
          [prefix .. "a"] = {
            -- ":GoTagAdd bson -transform camelcase<CR>",
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
