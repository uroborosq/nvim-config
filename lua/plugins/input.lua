-- lazy.nvim
return {
	"folke/snacks.nvim",
	keys = {
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Draft Buffer",
		},
		{
			"<leader>D",
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Draft Buffer",
		},
	},

	---@type snacks.Config
	opts = {
		input = { enabled = false },
	},
}
