return {
	"jedrzejboczar/toggletasks.nvim",
	lazy = true,
	keys = {
		-- group/label (no mapping)
		{ "<localleader>t", desc = "Toggle tasks" },

		-- actual mappings
		{ "<localleader>ts", "<Cmd>Telescope toggletasks spawn<CR>", mode = "n", desc = "toggletasks: spawn" },
		{ "<localleader>tc", "<Cmd>Telescope toggletasks select<CR>", mode = "n", desc = "toggletasks: select" },
		{ "<localleader>te", "<Cmd>Telescope toggletasks edit<CR>", mode = "n", desc = "toggletasks: edit config" },
	},
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "akinsho/toggleterm.nvim" },
		{ "nvim-telescope/telescope.nvim" },
	},
	opts = {},
}
