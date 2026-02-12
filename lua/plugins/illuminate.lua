return {
	"RRethy/vim-illuminate",
	event = "BufEnter",
	opts = {},
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
