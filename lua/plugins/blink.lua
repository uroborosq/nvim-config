return {
  "Saghen/blink.cmp",
  opts = {
    fuzzy = {
      sorts = { "sort_text" },
      implementation = "rust",
    },
    sources = {
      default = { "lsp" },
      providers = { snippets = {
        enabled = false,
      } },
    },
  },
}
