local get_shell = function()
  if vim.loop.os_uname().sysname == "Windows_NT" then
    return "pwsh.exe"
  else
    return nil
  end
end
return {
  {
    "akinsho/toggleterm.nvim",
    opts = {
      shell = get_shell(),
      direction = "float",
      float_opts = {
        width = function() return math.floor(vim.o.columns * 0.9) end,
        height = function() return math.floor(vim.o.lines * 0.8) end,
      },
      winbar = {
        enabled = true,
        name_formatter = function(term) return term.name end,
      },
    },
  },
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        t = {
          ["<C-esc>"] = { [[<C-\><C-n>]] },
          ["<C-h>"] = { [[<Cmd>wincmd h<CR>]] },
          ["<C-j>"] = { [[<Cmd>wincmd j<CR>]] },
          ["<C-k>"] = { [[<Cmd>wincmd k<CR>]] },
          ["<C-l>"] = { [[<Cmd>wincmd l<CR>]] },
          ["<C-w>"] = { [[<C-\><C-n><C-w>]] },
          ["<C-\\>"] = { "<cmd>Telescope toggleterm_manager<cr>", desc = "Search Toggleterms" },
        },
        n = {
          ["<C-\\>"] = { "<cmd>Telescope toggleterm_manager<cr>", desc = "Search Toggleterms" },
        },
      },
    },
  },
}
