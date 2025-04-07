return {
  "Saghen/blink.cmp",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    fuzzy = {
      sorts = { "sort_text" },
      implementation = "rust",
    },
    keymap = {
      -- ["<Tab>"] = {},
    },
    sources = {
      default = { "lsp" },
      providers = {
        snippets = {
          enabled = false,
        },
        path = {
          enabled = false,
        },
        buffer = {
          enabled = false,
        },
      },
    },
  },
}
