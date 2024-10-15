---@type LazySpec
return {
    "AstroNvim/astrocommunity",
    -- programming languages support (go added manually, without packs)
    { import = "astrocommunity.pack.lua" },
    { import = "astrocommunity.pack.bash" },
    { import = "astrocommunity.pack.docker" },
    { import = "astrocommunity.pack.json" },
    { import = "astrocommunity.pack.yaml" },
    { import = "astrocommunity.pack.python" },
    { import = "astrocommunity.pack.dart" },
    { import = "astrocommunity.pack.rust" },
    { import = "astrocommunity.pack.html-css" },
    { import = "astrocommunity.pack.proto" },

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
    -- commands to switch between different toggleterm windows
    { import = "astrocommunity.terminal-integration.toggleterm-manager-nvim" },
    -- scrollbar with diagnostic marks
    { import = "astrocommunity.scrolling.nvim-scrollbar" },
    -- self hosted ai assistant
    { import = "astrocommunity.completion.tabby-nvim" },
    -- open files from terminal into normal tabs
    { import = "astrocommunity.editing-support.stickybuf-nvim" },
    -- call telescope to see definitions, implementations and etc.
    { import = "astrocommunity.recipes.telescope-lsp-mappings" },
    -- can mount remote machine fs via sshfs
    { import = "astrocommunity.remote-development.remote-sshfs-nvim" },
    -- show pretty git branches graph
    { import = "astrocommunity.git.gitgraph-nvim" },
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
    { import = "astrocommunity.recipes.cache-colorscheme" },
    { import = "astrocommunity.git.diffview-nvim" },
}
