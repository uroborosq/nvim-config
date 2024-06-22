---@type LazySpec
return {
    "AstroNvim/astrocommunity",

    -- unit tests support
    { import = "astrocommunity.test.neotest" },
    -- show unit tests coverage
    --
    { import = "astrocommunity.pack.lua" },
    { import = "astrocommunity.pack.bash" },
    { import = "astrocommunity.pack.docker" },
    { import = "astrocommunity.pack.json" },
    { import = "astrocommunity.pack.yaml" },
    { import = "astrocommunity.pack.proto" },
    { import = "astrocommunity.test.nvim-coverage" },

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

    { import = "astrocommunity.bars-and-lines.vim-illuminate" },
    { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
    { import = "astrocommunity.indent.indent-rainbowline" },
    { import = "astrocommunity.utility.neodim" },
    { import = "astrocommunity.remote-development.distant-nvim" },
    { import = "astrocommunity.debugging.persistent-breakpoints-nvim" },
    { import = "astrocommunity.lsp.lsp-lens-nvim" },
    { import = "astrocommunity.editing-support.conform-nvim" },
    { import = "astrocommunity.lsp.lsp-signature-nvim" },
    { import = "astrocommunity.utility.mason-tool-installer-nvim" },
    { import = "astrocommunity.editing-support.nvim-regexplainer" },
    { import = "astrocommunity.lsp.nvim-lint" },
    { import = "astrocommunity.lsp.nvim-lsp-file-operations" },
    { import = "astrocommunity.recipes.neovide" },
}
