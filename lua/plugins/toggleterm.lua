local get_shell = function()
	if vim.loop.os_uname().sysname == "Windows_NT" then
		return "pwsh.exe"
	else
		return nil
	end
end
return {
	{
		"ryanmsnyder/toggleterm-manager.nvim",
		dependencies = {
			"akinsho/nvim-toggleterm.lua",
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
			"folke/which-key.nvim",
		},
		keys = {
			{
				"<C-\\>",
				"<cmd>Telescope toggleterm_manager<cr>",
				mode = { "n", "t" },
				desc = "Search Toggleterms",
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
		lazy = false,
		keys = {
			{ "<C-'>", ":ToggleTerm<cr>", mode = { "n", "i" } },
			{ "<C-Esc>", [[<C-\><C-n>]], mode = "t" },
			{ "<C-h>", [[<Cmd>wincmd h<CR>]], mode = "t" },
			{ "<C-j>", [[<Cmd>wincmd j<CR>]], mode = "t" },
			{ "<C-k>", [[<Cmd>wincmd k<CR>]], mode = "t" },
			{ "<C-l>", [[<Cmd>wincmd l<CR>]], mode = "t" },
			{ "<C-w>", [[<C-\><C-n><C-w>]], mode = "t" },
		},
		opts = {
			shell = get_shell(),
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
				name_formatter = function(term)
					return term.name
				end,
			},
		},
	},
}
