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

-- Relative Leuchtdichte einer Farbe (WCAG)
local function luminance(color)
	local function channel(v)
		v = v / 255
		return v <= 0.03928 and v / 12.92 or ((v + 0.055) / 1.055) ^ 2.4
	end
	return 0.2126 * channel(bit.rshift(color, 16))
		+ 0.7152 * channel(bit.band(bit.rshift(color, 8), 0xff))
		+ 0.0722 * channel(bit.band(color, 0xff))
end

-- snacks nimmt selectedLineBgColor aus dem Visual-Hintergrund. Je nach Theme stimmt dieser mit
-- Normal (quiet, unokai) oder NormalFloat (gruvbox-material) überein, daher bekommt das
-- lazygit-Fenster den Hintergrund mit dem stärkeren Kontrast zur Auswahl (bei Gleichstand Normal).
local function update_lazygit_bg()
	local function bg(name)
		return vim.api.nvim_get_hl(0, { name = name, link = false }).bg
	end
	local visual = bg("Visual")
	local best, best_ratio = "Normal", -1
	for _, name in ipairs({ "Normal", "NormalFloat" }) do
		local color = bg(name)
		local ratio = 0
		if color and visual then
			local a, b = luminance(color), luminance(visual)
			ratio = (math.max(a, b) + 0.05) / (math.min(a, b) + 0.05)
		end
		if ratio > best_ratio then
			best, best_ratio = name, ratio
		end
	end
	vim.api.nvim_set_hl(0, "LazygitNormal", { link = best })
end

update_lazygit_bg()
vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("config_lazygit_bg", { clear = true }),
	desc = "Hintergrund des lazygit-Fensters an das Theme anpassen",
	callback = update_lazygit_bg,
})

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
				desc = "LazyGit öffnen",
			},
		},
		---@type snacks.Config
		opts = {
			lazygit = {
				win = {
					width = 0,
					height = 0,
					border = "none",
					-- LazygitNormal: siehe update_lazygit_bg
					wo = { winhighlight = "Normal:LazygitNormal,NormalNC:LazygitNormal" },
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
