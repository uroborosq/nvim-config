return {
    {
        "AstroNvim/astrocore",
        optional = true,
        opts = {
            diagnostics = {
                virtual_text = false,
                -- virtual_lines = true,
                float = {
                    enabled = false,
                },
                jump = {
                    float = false,
                },
            },
        },
    },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        opts = {
            options = {
                show_source = true,
                multilines = {
                    -- Enable multiline diagnostic messages
                    enabled = true,
                    -- Always show messages on all lines for multiline diagnostics
                    always_show = true,
                },
                break_line = {
                    -- Enable the feature to break messages after a specific length
                    enabled = false,
                    -- Number of characters after which to break the line
                    after = 30,
                },
            },
        },
    },
}
-- return {
--     "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
--     event = "LspAttach",
--     dependencies = {
--         {
--             "AstroNvim/astrocore",
--             opts = {
--                 autocmds = {
--                     LspLinesPlugin = {
--                         {
--                             event = "FileType",
--                             pattern = "lazy",
--                             desc = "Disable plugin when opening `lazy` UI to avoid artifacts",
--                             callback = function()
--                                 ---@diagnostic disable-next-line: undefined-field
--                                 if not vim.diagnostic.config().virtual_lines then return end
--                                 require("lsp_lines").toggle()
--                                 vim.b.lsp_lines_temp_disabled_for_lazy_ft = true
--                             end,
--                         },
--                         {
--                             event = "BufLeave",
--                             desc = "Enable plugin when closing `lazy` UI",
--                             callback = function(args)
--                                 if
--                                     vim.bo[args.buf].filetype == "lazy" and vim.b.lsp_lines_temp_disabled_for_lazy_ft
--                                 then
--                                     require("lsp_lines").toggle()
--                                 end
--                             end,
--                         },
--                     },
--                 },
--             },
--         },
--     },
--     opts = {},
-- }
