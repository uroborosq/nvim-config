return {
  {
    "3rd/diagram.nvim",
    dependencies = {
      {
        "3rd/image.nvim",
        opts = {
          backend = "kitty", -- or "ueberzug" or "sixel"
          processor = "magick_cli", -- or "magick_rock"
          integrations = {
            markdown = {
              enabled = true,
              clear_in_insert_mode = true,
              download_remote_images = true,
              only_render_image_at_cursor = true,
              only_render_image_at_cursor_mode = "popup", -- or "inline"
              floating_windows = true, -- if true, images will be rendered in floating markdown windows
              filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
            },
            neorg = {
              enabled = true,
              filetypes = { "norg" },
            },
            typst = {
              enabled = true,
              filetypes = { "typst" },
            },
            html = {
              enabled = false,
            },
            css = {
              enabled = false,
            },
          },
          max_width = nil,
          max_height = nil,
          max_width_window_percentage = nil,
          max_height_window_percentage = 50,
          scale_factor = 1.0,
          window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
          window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
          editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
          tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
          hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
        },
      }, -- you'd probably want to configure image.nvim manually instead of doing this
    },
    opts = { -- you can just pass {}, defaults below
      events = {
        render_buffer = { "InsertLeave", "BufWinEnter", "TextChanged" },
        clear_buffer = { "BufLeave" },
      },
      renderer_options = {
        mermaid = {
          background = "transparent", -- nil | "transparent" | "white" | "#hex"
          theme = "dark", -- nil | "default" | "dark" | "forest" | "neutral"
          scale = nil, -- nil | 1 (default) | 2  | 3 | ...
          width = 1920, -- nil | 800 | 400 | ...
          height = 1080, -- nil | 600 | 300 | ...
          cli_args = nil, -- nil | { "--no-sandbox" } | { "-p", "/path/to/puppeteer" } | ...
        },
      },
      keys = {
        {
          "<Leader>k", -- or any key you prefer
          function() require("diagram").show_diagram_hover() end,
          mode = "n",
          ft = { "markdown", "norg" }, -- Only in these filetypes
          desc = "Show diagram in new tab",
        },
      },
    },
  },
}
