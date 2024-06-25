return {
    ---@type LazySpec
    {
        "AstroNvim/astroui",
        ---@type AstroUIOpts
        opts = {
            colorscheme = "everforest",
        },
    },
    "ellisonleao/gruvbox.nvim",
    opts = {
        italic = {
            strings = true,
            comments = true,
            folds = true,
            operations = false,
        },
    },
    { "olivercederborg/poimandres.nvim", opts = {} },
    { "AlexvZyl/nordic.nvim", opts = {} },
    "sainnhe/everforest",
    "savq/melange-nvim",
    "Mofiqul/vscode.nvim",
    "wadackel/vim-dogrun",
    "folke/tokyonight.nvim",
    "tiagovla/tokyodark.nvim",
    "slugbyte/lackluster.nvim",
    "ramojus/mellifluous.nvim",
    "xero/miasma.nvim",
    "briones-gabriel/darcula-solid.nvim",
    "rktjmp/lush.nvim",
    "ribru17/bamboo.nvim",
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
