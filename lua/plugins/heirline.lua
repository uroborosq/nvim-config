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

    local divider = {
      provider = function() return " " end,
    }

    table.insert(opts.statusline, 5, component)
    table.insert(opts.statusline, 12, status.component.nav())
    table.insert(opts.statusline, 13, divider)
    table.remove(opts.statusline, 3)
    table.remove(opts.statusline, 7)

    return opts
  end,
}
