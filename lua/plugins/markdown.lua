return {
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup {}
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  {
    -- For `plugins/markview.lua` users.
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
      -- preview = {
      --   enabled = true,
      --   splitview_winopts = {
      --     split = "right",
      --   },
      -- },
    },
  },
  -- {
  --   "3rd/diagram.nvim",
  --   dependencies = {
  --     {
  --       "3rd/image.nvim",
  --       opts = {},
  --     },
  --     {
  --       "OXY2DEV/markview.nvim",
  --     },
  --   },
  --   opts = {
  --     events = {
  --       -- render_buffer = { "InsertLeave", "BufWinEnter", "TextChanged" },
  --       -- clear_buffer = { "BufWinLeave" },
  --     },
  --     renderer_options = {
  --       mermaid = {
  --         background = "transparent", -- nil | "transparent" | "white" | "#hex"
  --         theme = "dark", -- nil | "default" | "dark" | "forest" | "neutral"
  --         scale = nil, -- nil | 1 (default) | 2  | 3 | ...
  --         width = 1920, -- nil | 800 | 400 | ...
  --         height = 1080, -- nil | 600 | 300 | ...
  --         cli_args = nil, -- nil | { "--no-sandbox" } | { "-p", "/path/to/puppeteer" } | ...
  --       },
  --     },
  --   },
  -- },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>ms"] = { ":Markview splitToggle<CR>", desc = "Toggle makrview split" },
          ["<Leader>mo"] = { ":PeekOpen<CR>", desc = "Open markdown webview" },
          ["<Leader>mc"] = { ":PeekClose<CR>", desc = "Close markdown webview" },
          ["<Leader>mh"] = { function() require("diagram").show_diagram_hover() end, desc = "Show diagram hover" },
        },
      },
    },
  },
}
