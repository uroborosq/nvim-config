return {
  "Saghen/blink.cmp",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    completion = {
      ghost_text = {
        enabled = true,
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
