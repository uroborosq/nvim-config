return {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle", -- optional for lazy loading on command
    event = { "User AstroFile", "InsertEnter" },
    opts = {
        trigger_events = { -- See :h events
            immediate_save = { "BufLeave", "FocusLost" }, -- vim events that trigger an immediate save
            defer_save = {}, -- vim events that trigger a deferred save (saves after `debounce_delay`)
            cancel_defered_save = {}, -- vim events that cancel a pending deferred save
        },
        callbacks = {
            before_saving = function()
                -- save global autoformat status
                vim.g.OLD_AUTOFORMAT = vim.g.autoformat_enabled

                vim.g.autoformat_enabled = false
                vim.g.OLD_AUTOFORMAT_BUFFERS = {}
                -- disable all manually enabled buffers
                for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                    if vim.b[bufnr].autoformat_enabled then
                        table.insert(vim.g.OLD_BUFFER_AUTOFORMATS, bufnr)
                        vim.b[bufnr].autoformat_enabled = false
                    end
                end
            end,
            after_saving = function()
                -- restore global autoformat status
                vim.g.autoformat_enabled = vim.g.OLD_AUTOFORMAT
                -- reenable all manually enabled buffers
                for _, bufnr in ipairs(vim.g.OLD_AUTOFORMAT_BUFFERS or {}) do
                    vim.b[bufnr].autoformat_enabled = true
                end
            end,
        },
    },
}
