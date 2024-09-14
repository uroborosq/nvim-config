---@type LazySpec
return {
    "AstroNvim/astrocommunity",
    -- programming languages support (go added manually, without packs)
    { import = "astrocommunity.pack.lua" },
    { import = "astrocommunity.pack.bash" },
    { import = "astrocommunity.pack.docker" },
    { import = "astrocommunity.pack.json" },
    { import = "astrocommunity.pack.yaml" },
    { import = "astrocommunity.pack.proto" },
    { import = "astrocommunity.pack.python" },
    { import = "astrocommunity.pack.dart" },
    { import = "astrocommunity.pack.rust" },
    { import = "astrocommunity.pack.html-css" },

    -- show unit tests coverage
    { import = "astrocommunity.test.nvim-coverage" },
    -- unit tests support
    { import = "astrocommunity.test.neotest" },
    -- colorful delimiters for tabulations
    { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
    -- ability to move lines up and down by <a-j> and <a-k>
    { import = "astrocommunity.editing-support.vim-move" },
    -- multicursors
    { import = "astrocommunity.editing-support.vim-visual-multi" },
    -- incremental selection
    { import = "astrocommunity.editing-support.wildfire-nvim" },
    -- highlight same words/symbols
    { import = "astrocommunity.bars-and-lines.vim-illuminate" },
    -- show interactive path to file at the top of buffer
    { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
    -- color indents
    { import = "astrocommunity.indent.indent-rainbowline" },
    -- formatter
    { import = "astrocommunity.editing-support.conform-nvim" },
    -- show signature of method when editing call arguments
    { import = "astrocommunity.lsp.lsp-signature-nvim" },
    -- external tools installer
    { import = "astrocommunity.utility.mason-tool-installer-nvim" },
    -- should show some hints for writing regexps
    { import = "astrocommunity.editing-support.nvim-regexplainer" },
    -- linter
    { import = "astrocommunity.lsp.nvim-lint" },
    -- settings for neovide client
    { import = "astrocommunity.recipes.neovide" },
    { import = "astrocommunity.colorscheme" },
    { import = "astrocommunity.terminal-integration.toggleterm-manager-nvim" },
    { import = "astrocommunity.scrolling.nvim-scrollbar" },
    { import = "astrocommunity.completion.tabby-nvim" },
    { import = "astrocommunity.editing-support.stickybuf-nvim" },
    { import = "astrocommunity.recipes.telescope-lsp-mappings" },
    { import = "astrocommunity.remote-development.remote-sshfs-nvim" },
}
