return {
    {
        "mfussenegger/nvim-lint",
        opts = {
            linters_by_ft = {
                go = { "golangcilint" },
            },
        },
        init = function(_)
            local lint = require "lint"
            local result = vim.deepcopy(lint.linters.golangcilint)

            lint.linters.golangcilint.parser = function(...)
                local diagnostics = result.parser(...)
                local filtered = {}
                for _, d in ipairs(diagnostics) do
                    if not (d.source == "typecheck") then table.insert(filtered, d) end
                end

                return filtered
            end
        end,
    },
}
