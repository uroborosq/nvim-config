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

    -- show unit tests coverage
    { import = "astrocommunity.test.nvim-coverage" },
    -- unit tests support
    { import = "astrocommunity.test.neotest" },
    -- colorful delimiters for tabulations
    { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
    -- some may be useful refactoring actions
    { import = "astrocommunity.editing-support.refactoring-nvim" },
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
    -- dim unused symbols
    { import = "astrocommunity.utility.neodim" },
    -- some plugin to connect via ssh to remote machine
    { import = "astrocommunity.remote-development.distant-nvim" },
    -- store breakpoints in some place (seems doesn't work)
    { import = "astrocommunity.debugging.persistent-breakpoints-nvim" },
    -- show number of definitions, references as code lens
    { import = "astrocommunity.lsp.lsp-lens-nvim" },
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
    --
    { import = "astrocommunity.lsp.nvim-lsp-file-operations" },
    -- settings for neovide client
    { import = "astrocommunity.recipes.neovide" },
    -- auto restore session in opened dir
    { import = "astrocommunity.terminal-integration.toggleterm-manager-nvim" },
    -- pure lua fzf
    { import = "astrocommunity.fuzzy-finder.fzf-lua" },
}
