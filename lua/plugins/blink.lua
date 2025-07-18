return {
  "Saghen/blink.cmp",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
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
