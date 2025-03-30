return { -- selected colorscheme
    -- {
    --     "AstroNvim/astrocore",
    --     opts = { options = { o = { background = "dark" } } },
    -- },
    -- installed colorschemes
    "xiantang/darcula-dark.nvim",
    "rktjmp/lush.nvim",
    {
        "EdenEast/nightfox.nvim",
        opts = {
            options = {
                styles = {
                    comments = "italic",
                    keywords = "bold",
                    types = "bold",
                    functions = "bold,italic",
                    conditionals = "bold",
                    constants = "bold,underline",
                    numbers = "italic",
                    strings = "italic",
                    variables = "",
                    operators = "",
                    preprocs = "",
                },
            },
        },
    },
    {
        "AstroNvim/astrocommunity",
        { import = "astrocommunity.colorscheme.bamboo-nvim" },
        { import = "astrocommunity.colorscheme.catppuccin" },
        { import = "astrocommunity.colorscheme.everforest" },
        { import = "astrocommunity.colorscheme.dracula-nvim" },
        { import = "astrocommunity.colorscheme.github-nvim-theme" },
        { import = "astrocommunity.colorscheme.gruvbox-nvim" },
        { import = "astrocommunity.colorscheme.hybrid-nvim" },
        { import = "astrocommunity.colorscheme.kanagawa-nvim" },
        { import = "astrocommunity.colorscheme.melange-nvim" },
        { import = "astrocommunity.colorscheme.miasma-nvim" },
        { import = "astrocommunity.colorscheme.tokyodark-nvim" },
        { import = "astrocommunity.colorscheme.vscode-nvim" },
        { import = "astrocommunity.colorscheme.everblush-nvim" },
        { import = "astrocommunity.colorscheme.palenight-nvim" },
    },
    {
        "goolord/alpha-nvim",
        opts = function(_, opts)
            -- customize the dashboard header
            opts.section.header.val = {
                "                                                     ",
                "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
                "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
                "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
                "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
                "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
                "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
                "                                                     ",
            }

            local dashboard = require "alpha.themes.dashboard"
            local term = require "alpha.term"

            -- opts.text = {}
            -- dashboard.section.terminal = {

            -- command = "ls",
            -- }
            dashboard.section.footer.val = {
                "     Talk is cheap. Show me the code",
                "                   -  Linus Torvalds",
            }
            -- dashboard.section.footer.opts = {
            --
            -- }

            dashboard.section.buttons.val = {
                dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
                dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
                dashboard.button("s", "  > Menu", "<Space>"),
                dashboard.button("q", "  > Quit NVIM", "<Space>Q<CR>"),
            }
            -- Layout

            dashboard.opts.layout = {
                {
                    type = "terminal",
                    command = "ls",
                },
                { type = "padding", val = 6 },
                dashboard.section.header,
                { type = "padding", val = 2 },
                {
                    type = "text",
                    val = {
                        "Talk is cheap. Show me the code",
                        "               - Linus Torvalds",
                    },
                    opts = {
                        position = "center",
                        hl = "italic",
                    },
                },
                { type = "padding", val = 4 },
                dashboard.section.buttons,
                { type = "padding", val = 2 },
                dashboard.section.footer,
            }
            return opts
        end,
    },
    {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
            options = {
                opt = { -- configure vim.opt options
                    -- configure font
                    guifont = "Adwaita Mono:h12:#e-subpixelantialias",
                    -- line spacing
                    linespace = 5,
                },
                g = { -- configure vim.g variables
                    -- configure scaling
                    neovide_scale_factor = 1.0,
                    -- configure padding
                    neovide_padding_top = 0,
                    neovide_padding_bottom = 0,
                    neovide_padding_right = 0,
                    neovide_padding_left = 0,
                    neovide_cursor_animation_length = 0.03,
                    neovide_transpareny = 0,
                    transparency = 0,
                },
            },
        },
    },
}
