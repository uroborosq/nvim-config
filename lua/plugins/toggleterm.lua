local get_shell = function()
	if vim.loop.os_uname().sysname == "Windows_NT" then
		return "pwsh.exe"
	else
		return nil
	end
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "toggleterm",
	callback = function()
		vim.opt_local.spell = false
	end,
})

-- toggleterm-Terminal im aktuellen Fenster (nil, wenn keins)
local function current_term()
	local buf = vim.api.nvim_get_current_buf()
	return require("toggleterm.terminal").find(function(t)
		return t.bufnr == buf
	end)
end

-- Ziel an der Stelle des aktuellen Terminals zeigen (gleiche Richtung)
local function show_in_place(cur, target)
	if target:is_open() then
		target:close()
	end
	if cur then
		cur:close()
		target:open(nil, cur.direction)
	else
		target:open()
	end
end

local function new_term()
	local Terminal = require("toggleterm.terminal").Terminal
	show_in_place(current_term(), Terminal:new())
end

-- Zum nächsten (step = 1) oder vorherigen (step = -1) Terminal wechseln
local function cycle_term(step)
	local cur = current_term()
	if not cur then
		return
	end
	local all = require("toggleterm.terminal").get_all()
	if #all < 2 then
		return
	end
	for i, t in ipairs(all) do
		if t.id == cur.id then
			show_in_place(cur, all[(i - 1 + step) % #all + 1])
			return
		end
	end
end

local function rename_term()
	local cur = current_term()
	if not cur then
		return
	end
	vim.ui.input({ prompt = "Terminalname: ", default = cur.display_name }, function(name)
		if name and name ~= "" then
			cur.display_name = name
			vim.cmd.redrawstatus({ bang = true })
		end
	end)
end

return {
	{
		"ryanmsnyder/toggleterm-manager.nvim",
		dependencies = {
			"akinsho/toggleterm.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
			"folke/which-key.nvim",
		},
		keys = {
			{
				"<leader>T",
				"<cmd>ToggleTerm direction=tab<cr>",
				desc = "Terminal in neuem Tab",
				silent = true,
			},
			{
				"<C-\\>",
				"<cmd>Telescope toggleterm_manager<cr>",
				mode = { "n", "t" },
				desc = "Terminals durchsuchen",
				silent = true,
			},
		},
		opts = function(_, opts)
			opts = opts or {}

			local toggleterm_manager = require("toggleterm-manager")
			local actions = toggleterm_manager.actions

			return {
				titles = { prompt = " Terminals" },
				mappings = {
					n = {
						["<CR>"] = { action = actions.toggle_term, exit_on_action = true }, -- toggles terminal open/closed
						["r"] = { action = actions.rename_term, exit_on_action = false }, -- provides a prompt to rename a terminal
						["d"] = { action = actions.delete_term, exit_on_action = false }, -- deletes a terminal buffer
						["n"] = { action = actions.create_term, exit_on_action = false }, -- creates a new terminal buffer
					},
					i = {
						["<CR>"] = { action = actions.toggle_term, exit_on_action = true }, -- toggles terminal open/closed
						["<C-r>"] = { action = actions.rename_term, exit_on_action = false }, -- provides a prompt to rename a terminal
						["<C-d>"] = { action = actions.delete_term, exit_on_action = false }, -- deletes a terminal buffer
						["<C-n>"] = { action = actions.create_term, exit_on_action = false }, -- creates a new terminal buffer
					},
				},
			}
		end,
		config = true,
	},
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "TermExec", "TermNew" },
		keys = {
			{
				"<C-'>",
				function()
					-- N<C-'> öffnet Terminal Nr. N
					vim.cmd((vim.v.count > 0 and vim.v.count or "") .. "ToggleTerm")
				end,
				mode = { "n", "i" },
				desc = "Terminal umschalten",
				silent = true,
			},
			{ "<C-Space>n", new_term, mode = { "n", "t" }, desc = "Neues Terminal" },
			{ "<C-Space>]", function() cycle_term(1) end, mode = { "n", "t" }, desc = "Nächstes Terminal" },
			{ "<C-Space>[", function() cycle_term(-1) end, mode = { "n", "t" }, desc = "Vorheriges Terminal" },
			{ "<C-Space>r", rename_term, mode = { "n", "t" }, desc = "Terminal umbenennen" },
		},
		opts = {
			shell = get_shell(),
			persist_mode = false,
			start_in_insert = false, -- übernimmt config.terminal (Scrollback-Regel)
			direction = "float",
			float_opts = {
				width = function()
					return math.floor(vim.o.columns * 0.9)
				end,
				height = function()
					return math.floor(vim.o.lines * 0.8)
				end,
			},
			winbar = {
				enabled = true,
				-- "1: zsh" bzw. "2: server" nach Umbenennen
				name_formatter = function(term)
					local name = term.display_name or vim.fn.fnamemodify(vim.split(term.name or "", ";")[1], ":t")
					return term.id .. ": " .. name
				end,
			},
		},
	},
}
