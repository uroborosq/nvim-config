-- lazygit открывает файлы через RPC к этому nvim (см. opts.lazygit.config.os).
-- Каждый вызов --remote-expr/--remote синхронный, поэтому шаги идут строго по порядку,
-- а нажатия клавиш не эмулируются и не попадают ни в lazygit, ни в cmdline.

-- Прячет окно lazygit (процесс продолжает работать, <leader>gg вернёт его в том же
-- состоянии) и переходит в обычное окно, чтобы файл не открылся в float/neo-tree.
function _G.lazygit_prepare()
	for _, term in ipairs(Snacks.terminal.list()) do
		if type(term.cmd) == "table" and term.cmd[1] == "lazygit" and term:win_valid() then
			term:hide()
		end
	end

	local function is_normal(win)
		local buf = vim.api.nvim_win_get_buf(win)
		return vim.api.nvim_win_get_config(win).relative == "" and vim.bo[buf].buftype == ""
	end
	if not is_normal(vim.api.nvim_get_current_win()) then
		for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
			if is_normal(win) then
				vim.api.nvim_set_current_win(win)
				break
			end
		end
	end

	vim.cmd.stopinsert()
	return ""
end

function _G.lazygit_goto(line)
	pcall(vim.api.nvim_win_set_cursor, 0, { line, 0 })
	vim.cmd("normal! zz")
	return ""
end

local nvim = 'nvim --server "$NVIM"'
local prepare = nvim .. ' --remote-expr "v:lua.lazygit_prepare()" >/dev/null'
-- --remote сам экранирует путь (fnameescape), так что подходят любые имена файлов
local function open(placeholder)
	return prepare .. " && " .. nvim .. " --remote " .. placeholder
end

return {
	-- {
	-- 	"folke/which-key",
	-- },
	{
		"folke/snacks.nvim",
		keys = {
			{
				"<leader>gg",
				function()
					require("snacks").lazygit.open()
				end,
				desc = "LazyGit",
			},
		},
		---@type snacks.Config
		opts = {
			lazygit = {
				win = {
					width = 0,
					height = 0,
					border = "none",
				},
				config = {
					os = {
						edit = open("{{filename}}"),
						editAtLine = open("{{filename}}")
							.. " && "
							.. nvim
							.. ' --remote-expr "v:lua.lazygit_goto({{line}})" >/dev/null',
						editInTerminal = false,
						open = open("{{filename}}"),
						openDirInEditor = open("{{dir}}"),
					},
				},
			},
		},
	},
}
