return { -- selected colorscheme
    ---@type LazySpec
    {
        "AstroNvim/astroui",
        ---@type AstroUIOpts
        opts = {
            colorscheme = "bamboo",
        },
    },
    {
        "AstroNvim/astrocore",
        opts = {
            options = {
                o = {
                    background = "dark",
                },
            },
        },
    },
    -- installed colorschemes
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
    {
        "AlexvZyl/nordic.nvim",
        config = function()
            require("nordic").setup {
                -- This callback can be used to override the colors used in the palette.
                on_palette = function(palette) return palette end,
                -- Enable bold keywords.
                bold_keywords = true,
                -- Enable italic comments.
                italic_comments = true,
                -- Enable general editor background transparency.
                transparent_bg = true,
                -- Enable brighter float border.
                bright_border = true,
                -- Reduce the overall amount of blue in the theme (diverges from base Nord).
                reduced_blue = true,
                -- Swap the dark background with the normal one.
                swap_backgrounds = false,
                -- Override the styling of any highlight group.
                override = {},
                -- Cursorline options.  Also includes visual/selection.
                cursorline = {
                    -- Bold font in cursorline.
                    bold = false,
                    -- Bold cursorline number.
                    bold_number = true,
                    -- Available styles: 'dark', 'light'.
                    theme = "dark",
                    -- Blending the cursorline bg with the buffer bg.
                    blend = 0.10,
                },
                noice = {
                    -- Available styles: `classic`, `flat`.
                    style = "classic",
                },
                telescope = {
                    -- Available styles: `classic`, `flat`.
                    style = "flat",
                },
                leap = {
                    -- Dims the backdrop when using leap.
                    dim_backdrop = false,
                },
                ts_context = {
                    -- Enables dark background for treesitter-context window
                    dark_background = true,
                },
            }
        end,
    },
    "sainnhe/everforest",
    "savq/melange-nvim",
    "Mofiqul/vscode.nvim",
    "folke/tokyonight.nvim",
    "tiagovla/tokyodark.nvim",
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
    {
        "rcarriga/nvim-dap-ui",
        config = function()
            local cfg = {
                controls = {
                    element = "repl",
                    enabled = true,
                    icons = {
                        disconnect = "",
                        pause = "",
                        play = "",
                        run_last = "",
                        step_back = "",
                        step_into = "",
                        step_out = "",
                        step_over = "",
                        terminate = "",
                    },
                },
                element_mappings = {},
                expand_lines = true,
                floating = {
                    border = "single",
                    mappings = {
                        close = { "q", "<Esc>" },
                    },
                },
                force_buffers = true,
                icons = {
                    collapsed = "",
                    current_frame = "",
                    expanded = "",
                },
                layouts = {
                    {
                        elements = {
                            {
                                id = "repl",
                                size = 0.2,
                            },
                            {
                                id = "stacks",
                                size = 0.6,
                            },
                            {
                                id = "watches",
                                size = 0.2,
                            },
                        },
                        position = "right",
                        size = 40,
                    },
                    {
                        elements = {
                            {
                                id = "scopes",
                                size = 1,
                            },
                        },
                        position = "bottom",
                        size = 10,
                    },
                },
                mappings = {
                    edit = "e",
                    expand = { "<CR>", "<2-LeftMouse>" },
                    open = "o",
                    remove = "d",
                    repl = "r",
                    toggle = "t",
                },
                render = {
                    indent = 1,
                    max_value_lines = 1,
                    max_type_length = 0,
                },
            }
            require("dapui").setup(cfg)
        end,
    },
}
