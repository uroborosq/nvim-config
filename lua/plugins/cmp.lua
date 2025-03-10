return {
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            opts.sources = {
                { name = "nvim_lsp", group_index = 1 },
                -- { name = "luasnip", group_index = 1 },
                -- { name = "buffer", group_index = 2 },
            }
            opts.mapping["<C-Space>"] = {}

            opts.sorting = {
                comparators = {
                    require("cmp.config.compare").sort_text,
                },
            }
        end,
    },
    -- {
    --     "codota/tabnine-nvim",
    --     main = "tabnine",
    --     build = vim.loop.os_uname().sysname == "Windows_NT" and "pwsh.exe -file .\\dl_binaries.ps1"
    --         or "./dl_binaries.sh",
    --     cmd = { "TabnineStatus", "TabnineDisable", "TabnineEnable", "TabnineToggle" },
    --     event = "User AstroFile",
    --     opts = { accept_keymap = "<C-space>" },
    -- },
}
