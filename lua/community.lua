-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.

---@type LazySpec
return {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.pack.lua" },
    { import = "astrocommunity.pack.docker" },
    { import = "astrocommunity.pack.proto" },
    { import = "astrocommunity.pack.yaml" },
    { import = "astrocommunity.pack.json" },
    { import = "astrocommunity.pack.markdown" },
    { import = "astrocommunity.pack.bash" },
    -- { import = "astrocommunity.pack.go" },
    { import = "astrocommunity.test.neotest" },
    { import = "astrocommunity.test.nvim-coverage" },
    { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
    { import = "astrocommunity.editing-support.refactoring-nvim" },
    { import = "astrocommunity.editing-support.vim-move" },
    { import = "astrocommunity.editing-support.vim-visual-multi" },
    { import = "astrocommunity.editing-support.wildfire-nvim" },
    -- подсвечивать одинаковые слова
    { import = "astrocommunity.bars-and-lines.vim-illuminate" },
    { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
    { import = "astrocommunity.indent.indent-rainbowline" },
    { import = "astrocommunity.debugging.persistent-breakpoints-nvim" },
    { import = "astrocommunity.lsp.lsp-lens-nvim" },
    -- import/override with your plugins folder
    { import = "astrocommunity.editing-support.conform-nvim" },
    { import = "astrocommunity.lsp.lsp-signature-nvim" },
    { import = "astrocommunity.utility.mason-tool-installer-nvim" },
    -- { import = "astrocommunity.completion.coq_nvim" },
    { import = "astrocommunity.editing-support.nvim-regexplainer" },
    { import = "astrocommunity.lsp.nvim-lint" },
    { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
    -- { import = "astrocommunity.diagnostics.trouble-nvim" },

    { import = "astrocommunity.recipes.neovide" },
}
