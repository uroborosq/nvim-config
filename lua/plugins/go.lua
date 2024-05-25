return {
      {
        "jay-babu/mason-null-ls.nvim",
        optional = true,
        opts = function(_, opts)
          opts.ensure_installed = require("astrocore").list_insert_unique(
            opts.ensure_installed,
            { "golangci-lint", "goimports-reviser" }
          )
        end,
      },
      {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        optional = true,
        opts = function(_, opts)
          opts.ensure_installed = require("astrocore").list_insert_unique(
            opts.ensure_installed,
            { "golangci-lint", "goimports-reviser" }
          )
        end,
      },
      {
        "stevearc/conform.nvim",
        opts = {
          formatters_by_ft = {
            go = { "gofumpt", "goimports-reviser" },
          },
        },
      },
      {
        "mfussenegger/nvim-lint",
        opts = {
          linters_by_ft = {
            go = { "golangcilint" }
          }
        }
      }
    },
    {
      "leoluz/nvim-dap-go",
      config = function()
        require("dap-go").setup {
          dap_configurations = {
            {
              type = "go",
              name = "Attach remote",
              mode = "remote",
              request = "attach",
              connect = {
                host = "localhost",
                port = "2345"
              },
              substitutePath = {
                { to = '/tmp/control_path', from = '${workspaceFolder}' },
              },
            },
          },
          delve = {
            port = "2345"
          },
        }
      end
    }
