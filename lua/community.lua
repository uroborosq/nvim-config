---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- programming languages support (go and proto added manually, without packs)
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.dart" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.cpp" },

  -- show unit tests coverage
  { import = "astrocommunity.test.nvim-coverage" },
  -- unit tests support
  { import = "astrocommunity.test.neotest" },
  -- colorful delimiters for tabulations
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  -- ability to move lines up and down by <a-j> and <a-k>
  { import = "astrocommunity.editing-support.vim-move" },
  -- incremental selection
  { import = "astrocommunity.editing-support.wildfire-nvim" },
  -- highlight same words/symbols
  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  -- show interactive path to file at the top of buffer
  { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
  -- formatter
  { import = "astrocommunity.editing-support.conform-nvim" },
  -- should show some hints for writing regexps
  { import = "astrocommunity.editing-support.nvim-regexplainer" },
  -- linter
  { import = "astrocommunity.lsp.nvim-lint" },
  -- settings for neovide client
  { import = "astrocommunity.recipes.neovide" },
  -- commands to switch between different toggleterm windows
  { import = "astrocommunity.terminal-integration.toggleterm-manager-nvim" },
  -- scrollbar with diagnostic marks
  { import = "astrocommunity.scrolling.nvim-scrollbar" },
  -- open files from terminal into normal tabs
  { import = "astrocommunity.editing-support.stickybuf-nvim" },
  -- call telescope to see definitions, implementations and etc.
  -- { import = "astrocommunity.recipes.telescope-lsp-mappings" },
  { import = "astrocommunity.recipes.picker-lsp-mappings" },
  { import = "astrocommunity.completion.avante-nvim" },

  -- can mount remote machine fs via sshfs
  -- converting between test cases
  { import = "astrocommunity.editing-support.text-case-nvim" },
  -- show tree of undo operations
  { import = "astrocommunity.editing-support.telescope-undo-nvim" },
  -- markdown preview in normal mode
  { import = "astrocommunity.markdown-and-latex.markview-nvim" },
  -- find and replace tui
  { import = "astrocommunity.search.grug-far-nvim" },
  -- do not open nested nvim sessions inside terminals and etc
  { import = "astrocommunity.terminal-integration.nvim-unception" },
  -- save last choosen colorscheme, overriding config
  { import = "astrocommunity.recipes.cache-colorscheme" },
  -- dim inactive windows
  { import = "astrocommunity.color.tint-nvim" },
  -- auto save plugin
  { import = "astrocommunity.editing-support.auto-save-nvim" },
  -- save files with sudo
  { import = "astrocommunity.editing-support.suda-vim" },
  -- updgraded jump mechanism - this is OP
  { import = "astrocommunity.motion.flash-nvim" },
  -- show images in neovim (kitty only)
  { import = "astrocommunity.media.image-nvim", cond = vim.env.TERM == "xterm-kitty" },
  -- create shortcuts as tasks for running commands
  { import = "astrocommunity.code-runner.toggletasks-nvim" },
  { import = "astrocommunity.editing-support.refactoring-nvim" },
  { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
  { import = "astrocommunity.recipes.heirline-clock-statusline" },
  { import = "astrocommunity.fuzzy-finder.telescope-nvim" },
  { import = "astrocommunity.recipes.telescope-lsp-mappings" },
  { import = "astrocommunity.split-and-window.colorful-winsep-nvim" },
  -- { import = "astrocommunity.editing-support.other-nvim" },
  { import = "astrocommunity.completion.codex-nvim" },
}
