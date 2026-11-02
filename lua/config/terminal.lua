local M = {}

-- Programme, die Ctrl+hjkl selbst verarbeiten (Taste wird durchgereicht)
M.passthrough = { "nvim", "vim", "lazygit", "fzf", "claude" }

-- Dateiinhalt lesen (nil bei Fehler)
local function read_file(path)
	local f = io.open(path)
	if not f then
		return nil
	end
	local data = f:read("*a")
	f:close()
	return data
end

-- Name des Vordergrundprozesses des Terminals (nil bei Fehler)
function M.foreground(buf)
	local pid = vim.b[buf].terminal_job_pid
	if not pid then
		return nil
	end
	local stat = read_file("/proc/" .. pid .. "/stat")
	if not stat then
		return nil
	end
	-- comm kann Leerzeichen/Klammern enthalten: alles nach der letzten ")"
	local rest = stat:match(".*%)(.*)")
	if not rest then
		return nil
	end
	local tpgid = vim.split(vim.trim(rest), "%s+")[6]
	if not tpgid then
		return nil
	end
	local comm = read_file("/proc/" .. tpgid .. "/comm")
	if not comm then
		return nil
	end
	return (comm:gsub("\n$", ""))
end

-- Tasten für Ctrl+<dir> im Terminalmodus: durchreichen oder Fenster wechseln
function M.nav_keys(dir, buf)
	if vim.tbl_contains(M.passthrough, M.foreground(buf)) then
		return "<C-" .. dir .. ">"
	end
	return "<C-\\><C-n><Cmd>wincmd " .. dir .. "<CR>"
end

local nav_desc = {
	h = "Zum linken Fenster",
	j = "Zum unteren Fenster",
	k = "Zum oberen Fenster",
	l = "Zum rechten Fenster",
}
for dir, desc in pairs(nav_desc) do
	vim.keymap.set("t", "<C-" .. dir .. ">", function()
		return M.nav_keys(dir, vim.api.nvim_get_current_buf())
	end, { expr = true, silent = true, desc = desc })
end

vim.keymap.set("t", "<C-Esc>", [[<C-\><C-n>]], { desc = "Terminalmodus verlassen" })

-- Automatisch in den Terminalmodus wechseln, außer beim Scrollback
local group = vim.api.nvim_create_augroup("config_terminal", { clear = true })

vim.api.nvim_create_autocmd("TermLeave", {
	group = group,
	desc = "Cursorposition beim Verlassen des Terminalmodus merken",
	callback = function(ev)
		if ev.buf ~= vim.api.nvim_get_current_buf() or vim.bo[ev.buf].buftype ~= "terminal" then
			return
		end
		vim.b[ev.buf].term_leave_pos = vim.api.nvim_win_get_cursor(0)
	end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
	group = group,
	desc = "Terminal als gescrollt markieren, wenn der Cursor bewegt wurde",
	callback = function(ev)
		if vim.bo[ev.buf].buftype ~= "terminal" then
			return
		end
		-- Direkt aus dem Terminalmodus verlassen: term_leave_pos ist noch veraltet
		if vim.api.nvim_get_mode().mode == "t" then
			vim.b[ev.buf].term_scrolled = nil
			return
		end
		local pos = vim.b[ev.buf].term_leave_pos
		local cur = vim.api.nvim_win_get_cursor(0)
		-- Ausgabe zieht den Cursor in der letzten Zeile mit: das ist kein Scrollen
		if pos and not vim.deep_equal(pos, cur) and cur[1] < vim.api.nvim_buf_line_count(ev.buf) then
			vim.b[ev.buf].term_scrolled = true
		end
	end,
})

-- Modus verzögert anpassen (synchrones startinsert leckt in Nicht-Terminal-Puffer)
local function maybe_insert(buf)
	vim.schedule(function()
		if not vim.api.nvim_buf_is_valid(buf) or vim.api.nvim_get_current_buf() ~= buf then
			return
		end
		if vim.bo[buf].buftype ~= "terminal" or vim.fn.jobwait({ vim.bo[buf].channel }, 0)[1] ~= -1 then
			return
		end
		local mode = vim.api.nvim_get_mode().mode
		if vim.b[buf].term_scrolled then
			if mode == "t" then
				vim.cmd.stopinsert()
			end
		elseif mode == "nt" then
			vim.cmd.startinsert()
		end
	end)
end

vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter", "TermOpen" }, {
	group = group,
	desc = "Beim Betreten eines Terminals in den Terminalmodus wechseln",
	callback = function(ev)
		if vim.bo[ev.buf].buftype == "terminal" then
			maybe_insert(ev.buf)
		end
	end,
})

vim.api.nvim_create_autocmd("TermEnter", {
	group = group,
	desc = "Scroll-Markierung zurücksetzen",
	callback = function(ev)
		vim.b[ev.buf].term_scrolled = nil
	end,
})

-- Nicht-Float-Fenster eines Tabs
local function normal_wins(tab)
	return vim.tbl_filter(function(w)
		return vim.api.nvim_win_get_config(w).relative == ""
	end, vim.api.nvim_tabpage_list_wins(tab or 0))
end

-- Puffer in einem neuen Tab zeigen (Platzhalterpuffer wird verworfen)
function M.open_in_tab(buf)
	vim.cmd.tabnew()
	vim.bo.bufhidden = "wipe"
	vim.api.nvim_win_set_buf(0, buf)
	vim.wo.number = false
	vim.wo.relativenumber = false
	vim.wo.signcolumn = "no"
end

-- Terminal zwischen float/split/tab verschieben (Prozess läuft weiter)
local function placement(win)
	if vim.api.nvim_win_get_config(win).relative ~= "" then
		return "float"
	end
	if #normal_wins() == 1 and #vim.api.nvim_list_tabpages() > 1 then
		return "tab"
	end
	return "split"
end

function M.move(target)
	local win = vim.api.nvim_get_current_win()
	local buf = vim.api.nvim_win_get_buf(win)
	if vim.bo[buf].buftype ~= "terminal" then
		return
	end
	local current = placement(win)
	if current == target then
		return
	end

	-- toggleterm-Terminal: Richtung wird dort gemerkt
	local tt = package.loaded["toggleterm.terminal"]
	if tt then
		local term = tt.find(function(t)
			return t.bufnr == buf
		end)
		if term then
			term:close()
			term:open(nil, target)
			return
		end
	end

	-- Sonstige Terminals: Fenster schließen, Puffer in neuem Fenster öffnen
	local normal = normal_wins()
	if current == "tab" then
		vim.cmd.tabclose()
	elseif current == "float" or #normal > 1 then
		vim.api.nvim_win_close(win, true)
	else
		-- letztes Fenster: Platzhalter statt Schließen
		vim.cmd.enew()
	end

	if target == "float" then
		local width = math.floor(vim.o.columns * 0.9)
		local height = math.floor(vim.o.lines * 0.8)
		vim.api.nvim_open_win(buf, true, {
			relative = "editor",
			width = width,
			height = height,
			row = math.floor((vim.o.lines - height) / 2),
			col = math.floor((vim.o.columns - width) / 2),
			border = "rounded",
		})
	elseif target == "tab" then
		M.open_in_tab(buf)
	else
		vim.cmd(target == "vertical" and "botright vsplit" or "botright split")
		vim.api.nvim_win_set_buf(0, buf)
	end
end

local move_maps = {
	{ "f", "float", "Terminal in Float-Fenster verschieben" },
	{ "s", "horizontal", "Terminal in horizontalen Split verschieben" },
	{ "v", "vertical", "Terminal in vertikalen Split verschieben" },
	{ "t", "tab", "Terminal in neuen Tab verschieben" },
}

vim.api.nvim_create_autocmd("TermOpen", {
	group = group,
	desc = "Tasten zum Verschieben des Terminals setzen",
	callback = function(ev)
		for _, m in ipairs(move_maps) do
			vim.keymap.set({ "n", "t" }, "<C-Space>" .. m[1], function()
				M.move(m[2])
			end, { buffer = ev.buf, desc = m[3] })
		end
	end,
})

-- Zoom des aktuellen Fensters umschalten
vim.keymap.set({ "n", "t" }, "<C-Space>z", function()
	if not _G.Snacks then
		vim.notify("zoom: snacks.nvim nicht verfügbar", vim.log.levels.WARN)
		return
	end
	-- Ein offener Zoom ist selbst ein Float: dann muss er sich wieder schließen lassen
	local zoomed = Snacks.zen.win and Snacks.zen.win:valid()
	if not zoomed and vim.api.nvim_win_get_config(0).relative ~= "" then
		vim.notify("zoom: im Float-Fenster nicht verfügbar")
		return
	end
	Snacks.zen.zoom()
end, { desc = "Fenster-Zoom umschalten" })

return M
