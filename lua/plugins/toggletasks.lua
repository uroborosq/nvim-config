return {
	"jedrzejboczar/toggletasks.nvim",
	lazy = true,
	keys = {
		-- group/label (no mapping)
		{ "<localleader>t", desc = "Aufgaben" },

		-- actual mappings
		{ "<localleader>ts", "<Cmd>Telescope toggletasks spawn<CR>", mode = "n", desc = "Aufgabe starten", silent = true },
		{ "<localleader>tc", "<Cmd>Telescope toggletasks select<CR>", mode = "n", desc = "Aufgabe auswählen", silent = true },
		{ "<localleader>te", "<Cmd>Telescope toggletasks edit<CR>", mode = "n", desc = "Aufgabenkonfiguration bearbeiten", silent = true },
	},
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "akinsho/toggleterm.nvim" },
		{ "nvim-telescope/telescope.nvim" },
	},
	opts = {},
}
