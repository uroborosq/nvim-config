local prefix = "<Leader>G"
return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed =
          require("astrocore").list_insert_unique(opts.ensure_installed, { "go", "gomod", "gosum", "gowork", "asm" })
      end
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "gomodifytags",
        "gofumpt",
        "iferr",
        "impl",
        "goimports",
        "golangci-lint",
        "goimports-reviser",
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "gopls",
        "delve",
        "gopls",
        "gomodifytags",
        "gofumpt",
        "iferr",
        "impl",
        "goimports",
        "stylua",
        "golangci-lint",
        "goimports-reviser",
        "buf",
      })
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function() require("dap-go").setup {} end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "delve" })
    end,
  },
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
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        go = { "golangcilint" },
      },
    },
    init = function(_, _)
      local lint = require "lint"
      local result = vim.deepcopy(lint.linters.golangcilint)

      lint.linters.golangcilint.parser = function(output, bufnr, cwd)
        local diagnostics = result.parser(output, bufnr, cwd)
        local filtered = {}
        for _, d in ipairs(diagnostics) do
          if not (d.source == "typecheck") then table.insert(filtered, d) end
        end

        return filtered
      end
    end,
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      config = {
        gopls = {
          settings = {
            gopls = {
              analyses = {
                ST1000 = false,
                ST1021 = false,
                ST1003 = true,
                fieldalignment = false,
                fillreturns = true,
                nilness = true,
                nonewvars = true,
                shadow = false,
                undeclaredname = true,
                unreachable = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
                simplifyrange = true,
              },
              codelenses = {
                generate = true, -- show the `go generate` lens.
                regenerate_cgo = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = false,
              },
              hints = {
                ignoredError = true,
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              experimentalPostfixCompletions = true,
              buildFlags = { "-tags", "integration" },
              symbolMatcher = "Fuzzy",
              completeUnimported = true,
              diagnosticsDelay = "500ms",
              staticcheck = true,
              usePlaceholders = true,
              vulncheck = "Imports",
              semanticTokens = true,
            },
          },
        },
      },
    },
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
                stderr_buffered = true,
                on_stderr = function(_, data)
                  if data and #data > 1 then vim.notify(table.concat(data, "\n"), vim.log.levels.WARN) end
                end,
                on_exit = function(_, _) vim.notify "golangci-lint --fix done" end,
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
