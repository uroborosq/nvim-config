return {
	"jedrzejboczar/toggletasks.nvim",
	lazy = true,
	keys = {
		-- group/label (no mapping)
		{ "<localleader>t", desc = "Toggle tasks" },

		-- actual mappings
		{ "<localleader>ts", "<Cmd>Telescope toggletasks spawn<CR>", mode = "n", desc = "toggletasks: spawn", silent = true },
		{ "<localleader>tc", "<Cmd>Telescope toggletasks select<CR>", mode = "n", desc = "toggletasks: select", silent = true },
		{ "<localleader>te", "<Cmd>Telescope toggletasks edit<CR>", mode = "n", desc = "toggletasks: edit config", silent = true },
	},
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "akinsho/toggleterm.nvim" },
		{ "nvim-telescope/telescope.nvim" },
	},
	opts = {},
}
