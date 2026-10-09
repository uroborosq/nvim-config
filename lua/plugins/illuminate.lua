return {
	"RRethy/vim-illuminate",
	event = "BufEnter",
	opts = {},
	keys = {
		{
			"]r",
			function()
				require("illuminate").goto_next_reference()
			end,
			desc = "Nächste Referenz",
		},
		{
			"[r",
			function()
				require("illuminate").goto_prev_reference()
			end,
			desc = "Vorherige Referenz",
		},
	},
	config = function(_, opts)
		require("illuminate").configure(opts)
	end,
	specs = {
		{
			"catppuccin",
			optional = true,
			---@type CatppuccinOptions
			opts = { integrations = { illuminate = true } },
		},
	},
}
