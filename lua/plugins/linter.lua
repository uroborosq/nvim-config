return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        go = { "golangcilint" },
      },
    },
    init = function(_, _)
      local lint = require "lint"
      local result = vim.deepcopy(lint.linters.golangcilint)

      lint.linters.golangcilint.parser = function(output, bufnr, cwd)
        local diagnostics = result.parser(output, bufnr, cwd)
        local filtered = {}
        for _, d in ipairs(diagnostics) do
          if not (d.source == "typecheck") then table.insert(filtered, d) end
        end

        return filtered
      end
    end,
  },
}
