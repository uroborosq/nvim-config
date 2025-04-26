local prefix = "<Leader>c"
return {
  "mistricky/codesnap.nvim",
  build = "make",
  cmd = { "CodeSnap", "CodeSnapSave", "CodeSnapHighlight", "CodeSnapSaveHighlight", "CodeSnapASCII" },
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          v = {
            [prefix] = { desc = " CodeSnap" },
            [prefix .. "s"] = { ":'<,'>CodeSnap<CR>", desc = "CodeSnap (clipboard)" },
            [prefix .. "S"] = { ":'<,'>CodeSnapSave<CR>", desc = "CodeSnap (save)" },
            [prefix .. "h"] = {
              ":'<,'>CodeSnapHighlight<CR>",
              desc = "CodeSnap with highlight (clipboard)",
            },
            [prefix .. "H"] = { ":'<,'>CodeSnapSaveHighlight<CR>", desc = "CodeSnap with highlight (save)" },
            [prefix .. "a"] = { ":'<,'>CodeSnapASCII<CR>", desc = "CodeSnap as ASCII art (clipboard)" },
          },
        },
      },
    },
  },
  opts = {
    mac_window_bar = false,
    watermark = "",
    bg_padding = 10,
  },
}
