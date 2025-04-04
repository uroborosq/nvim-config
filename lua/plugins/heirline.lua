return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astroui.status"

    local component = {
      provider = function()
        local starts = vim.fn.line "v"
        local ends = vim.fn.line "."
        local lines = starts <= ends and ends - starts + 1 or starts - ends + 1
        return " " .. tostring(lines) .. " lines " .. tostring(vim.fn.wordcount().visual_chars) .. " chars"
      end,
      hl = status.hl.mode_bg(),
      condition = function() return vim.fn.mode():find "[Vv]" end,
    }

    table.insert(opts.statusline, 5, component)
    table.remove(opts.statusline, 3)

    return opts
  end,
}
