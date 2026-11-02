vim.opt_local.expandtab = true
vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2

-- The Nim indent script uses syntax groups to skip strings and comments.
-- Tree-sitter clears 'syntax' when starting; restore it after FileType handlers.
local bufnr = vim.api.nvim_get_current_buf()
vim.schedule(function()
	if vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].filetype == "nim" then
		vim.bo[bufnr].syntax = "nim"
	end
end)

vim.b.undo_ftplugin = (vim.b.undo_ftplugin or "")
	.. " | setlocal expandtab< tabstop< shiftwidth< softtabstop< syntax<"
