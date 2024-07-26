return { -- selected colorscheme
    ---@type LazySpec
    {
        "AstroNvim/astroui",
        ---@type AstroUIOpts
        opts = {
            colorscheme = "catppuccin",
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
    { "AlexvZyl/nordic.nvim", opts = {} },
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
                    max_value_lines = 100,
                },
            }
            require("dapui").setup(cfg)
        end,
    },
}
