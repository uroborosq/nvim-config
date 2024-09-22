return { -- selected colorscheme
    ---@type LazySpec
    {
        "AstroNvim/astroui",
        ---@type AstroUIOpts
        opts = {
            colorscheme = "kanagawa",
        },
    },
    {
        "AstroNvim/astrocore",
        opts = { options = { o = { background = "dark" } } },
    },
    -- installed colorschemes
    "briones-gabriel/darcula-solid.nvim",
    "rktjmp/lush.nvim",
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
        { import = "astrocommunity.colorscheme.mellifluous-nvim" },
        { import = "astrocommunity.colorscheme.miasma-nvim" },
        { import = "astrocommunity.colorscheme.mini-base16" },
        { import = "astrocommunity.colorscheme.nightfox-nvim" },
        { import = "astrocommunity.colorscheme.poimandres-nvim" },
        { import = "astrocommunity.colorscheme.tokyodark-nvim" },
        { import = "astrocommunity.colorscheme.tokyonight-nvim" },
        { import = "astrocommunity.colorscheme.vim-dogrun" },
        { import = "astrocommunity.colorscheme.vscode-nvim" },
    },
    {
        "goolord/alpha-nvim",
        opts = function(_, opts)
            -- customize the dashboard header
            opts.section.header.val = {
                "                   ▄                    ",
                "                  ▟█▙                  ",
                "                 ▟███▙                 ",
                "                ▟█████▙                ",
                "               ▟███████▙               ",
                "              ▂▔▀▜██████▙              ",
                "             ▟██▅▂▝▜█████▙             ",
                "            ▟█████████████▙            ",
                "           ▟███████████████▙           ",
                "          ▟█████████████████▙          ",
                "         ▟███████████████████▙         ",
                "        ▟█████████▛▀▀▜████████▙        ",
                "       ▟████████▛      ▜███████▙       ",
                "      ▟█████████        ████████▙      ",
                "     ▟██████████        █████▆▅▄▃▂     ",
                "    ▟██████████▛        ▜█████████▙    ",
                "   ▟██████▀▀▀              ▀▀██████▙   ",
                "  ▟███▀▘                       ▝▀███▙  ",
                " ▟▛▀                               ▀▜▙ ",
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
                    guifont = "Source Code Pro:h12:#e-subpixelantialias",
                    -- line spacing
                    linespace = 3,
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
                },
            },
        },
    },
}
