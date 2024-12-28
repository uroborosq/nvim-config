return { -- selected colorscheme
    -- {
    --     "AstroNvim/astrocore",
    --     opts = { options = { o = { background = "dark" } } },
    -- },
    -- installed colorschemes
    "doums/darcula",
    {
        {
            "xiantang/darcula-dark.nvim",
            config = function()
                -- setup must be called before loading
                require("darcula").setup {
                    -- override = function(_)
                    --     return {
                    --         background = "#333333",
                    --         dark = "#000000",
                    --     }
                    -- end,
                    opt = {
                        integrations = {
                            telescope = true,
                            lualine = true,
                            lsp_semantics_token = true,
                            nvim_cmp = true,
                            dap_nvim = true,
                        },
                    },
                }
            end,
        },
    },
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
        { import = "astrocommunity.colorscheme.everblush-nvim" },
        { import = "astrocommunity.colorscheme.palenight-nvim" },
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
                    neovide_transpareny = 0,
                    transparency = 0,
                },
            },
        },
    },
}
