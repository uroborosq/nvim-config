return {
  {
    "knubie/vim-kitty-navigator",
    build = "ln -f ./*.py ~/.config/kitty/",
    cond = vim.env.TERM == "xterm-kitty",
  },
  {
    "mikesmithgh/kitty-scrollback.nvim",
    cond = vim.env.TERM == "xterm-kitty",
    lazy = true,
    cmd = {
      "KittyScrollbackGenerateKittens",
      "KittyScrollbackCheckHealth",
      "KittyScrollbackGenerateCommandLineEditing",
    },
    event = { "User KittyScrollbackLaunch" },
    version = "*", -- latest stable version, may have breaking changes if major version changed
    -- version = '^6.0.0', -- pin major version, include fixes and features that do not have breaking changes
    config = function() require("kitty-scrollback").setup() end,
  },
}
