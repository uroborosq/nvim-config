return {
  "Saghen/blink.cmp",
  build = "cargo build --release",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
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
