return {
    {
        "folke/edgy.nvim",
        dependencies = {
            {
                "AstroNvim/astrocore",
                opts = {
                    mappings = {
                        n = {
                            ["<Leader>F"] = { function() require("edgy").toggle() end, desc = "Toggle Sidebars" },
                            ["<Leader>f"] = { function() require("edgy").select() end, desc = "Pick Sidebar" },
                        },
                    },
                },
            },
        },
        opts = {
            exit_when_last = false,
            animate = {
                enabled = false,
            },
            bottom = {
                {
                    title = "Terminal",
                    ft = "toggleterm",
                    size = { height = 0.3 },
                    filter = function(buf, win) return vim.api.nvim_win_get_config(win).relative == "" end,
                    open = "ToggleTerm direction=horizontal",
                    pinned = true,
                },
                { ft = "qf", title = "QuickFix" },
                {
                    ft = "help",
                    size = { height = 20 },
                    -- don't open help files in edgy that we're editing
                    filter = function(buf) return vim.bo[buf].buftype == "help" end,
                },
                {
                    title = "Test output",
                    ft = "neotest-output-panel",
                    open = function() require("neotest").output_panel() end,
                }
            },
            left = {
                {
                    title = "tree",
                    ft = "neo-tree",
                    pinned = true,
                    open = "Neotree position=left",
                },
            },
            right = {
                {
                    ft = "aerial",
                    title = "Symbol Outline",
                    pinned = true,
                    open = function() require("aerial").open() end,
                },
                {
                    ft = "neotest-summary",
                    open = function() require("neotest").summary.toggle() end,
                    pinned = true,
                },
            },
            keys = {
                -- increase width
                ["<C-Right>"] = function(win) win:resize("width", 2) end,
                -- decrease width
                ["<C-Left>"] = function(win) win:resize("width", -2) end,
                -- increase height
                ["<C-Up>"] = function(win) win:resize("height", 2) end,
                -- decrease height
                ["<C-Down>"] = function(win) win:resize("height", -2) end,
            },
        },
    },
}
