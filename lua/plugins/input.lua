-- lazy.nvim
return {
	"folke/snacks.nvim",
	keys = {
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Notizpuffer umschalten",
		},
		{
			"<leader>D",
			function()
				Snacks.scratch.select()
			end,
			desc = "Notizpuffer auswählen",
		},
	},

	---@type snacks.Config
	opts = {
		input = { enabled = false },
	},
}
