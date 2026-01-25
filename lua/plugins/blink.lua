return {
  "Saghen/blink.cmp",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  dependencies = {
    {
      "edte/blink-go-import.nvim",
      ft = "go",
      config = function() require("blink-go-import").setup() end,
    },
    { "samiulsami/cmp-go-deep", dependencies = { "kkharji/sqlite.lua" } },
    { "saghen/blink.compat" },
  },
  opts = {
    completion = {
      menu = {
        draw = {
          columns = {
            { "kind_icon", "label", "label_description", gap = 1 },
            { "kind", gap = 1, "source_name" },
          },
        },
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = true,
        },
      },
    },
    fuzzy = {
      sorts = { "sort_text" },
      implementation = "rust",
    },

    keymap = {
      -- ["<Tab>"] = {
      --   function(cmp)
      --     if cmp.snippet_active() then
      --       return cmp.accept()
      --     else
      --       return cmp.select_and_accept()
      --     end
      --   end,
      --   "snippet_forward",
      --   "fallback",
      -- },
      -- ["<S-Tab>"] = { "snippet_backward", "fallback" },
      -- ["<Tab>"] = {},
      ["<C-N>"] = {},
      ["<C-P>"] = {},
      ["<C-Space>"] = { function(cmp) cmp.show { providers = { "snippets" } } end },
    },
    sources = {
      default = {--[[  "go_deep", "go_pkgs", ]]
        "lsp",
        "path",
      },
      providers = {
        go_pkgs = {
          enabled = false,
          module = "blink-go-import",
          name = "Import",
        },
        go_deep = {
          enabled = false,
          name = "go_deep",
          module = "blink.compat.source",
          min_keyword_length = 3,
          max_items = 5,
          ---@module "cmp_go_deep"
          ---@type cmp_go_deep.Options
          opts = {},
        },
        snippets = {
          enabled = false,
        },
        path = {
          enabled = true,
        },
        buffer = {
          enabled = true,
        },
      },
    },
  },
}
