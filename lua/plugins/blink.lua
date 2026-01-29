return {
  "Saghen/blink.cmp",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  dependencies = {
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
      ["<C-N>"] = {},
      ["<C-P>"] = {},
      ["<C-Space>"] = { function(cmp) cmp.show { providers = { "snippets" } } end },
    },
    sources = {
      default = { "lsp", "path" },
      providers = {
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
