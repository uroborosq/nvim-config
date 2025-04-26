local ignoring_code_actions = {
  ["source.doc"] = true,
  ["source.assembly"] = true,
  ["source.test"] = true,
  ["gopls.doc.features"] = true,
  ["source.addTest"] = true,
}

--- @argument action lsp.CodeAction|lsp.Command
--- @return boolean
local function is_gopls(action)
  if not (action.command == nil) then
    if not (action.command.command == nil) then
      if not (action.command.command:find "gopls" == nil) then return true end
    end
  end

  if not (action.data == nil) then
    if not (action.data.command == nil) then
      if not (action.data.command:find "gopls" == nil) then return true end
    end
  end
  return false
end

return {
  {
    "AstroNvim/astrolsp",
    optiona = true,
    ---@type AstroLSPOpts
    ---@diagnostic disable-next-line: missing-fields
    opts = {
      capabilities = {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = true,
          },
        },
      },
      config = {
        gopls = {
          settings = {
            gopls = {
              analyses = {
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
              diagnosticsDelay = "50ms",
              staticcheck = true,
              usePlaceholders = true,
              vulncheck = "Imports",
            },
          },
        },
      },
      features = {
        signature_help = true,
        inlay_hints = true,
      },
      -- formatting = {
      --     format_on_save = true,
      -- },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@param opts AstroLSPOpts
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      vim.list_extend(opts.servers, { "protols" })
    end,
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>lc"] = {
            require("telescope.builtin").lsp_incoming_calls,
            desc = "Incomming calls",
          },
          ["<Leader>lC"] = {
            require("telescope.builtin").lsp_outgoing_calls,
            desc = "Outgoing calls",
          },
          ["<Leader>lA"] = {
            vim.lsp.buf.code_action,
            desc = "show all code actions",
          },
          ["<Leader>lu"] = {
            ":LspRestart<CR>",
            desc = "Restart LSP",
          },
          ["<Leader>la"] = {
            function()
              vim.lsp.buf.code_action {
                filter = function(action)
                  local gopls_detected = is_gopls(action)
                  if gopls_detected and ignoring_code_actions[action.kind] then return false end

                  return true
                end,
              }
            end,
            desc = "show code actions",
          },
        },
      },
    },
  },
}
