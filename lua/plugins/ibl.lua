local highlight = {
	"SnacksIndent1",
	"SnacksIndent2",
	"SnacksIndent3",
	"SnacksIndent4",
	"SnacksIndent5",
	"SnacksIndent6",
	"SnacksIndent7",
	"SnacksIndent8",
}

return {
	{
		"HiPhish/rainbow-delimiters.nvim",
		config = function()
			require("rainbow-delimiters.setup").setup({
				highlight = highlight,
			})
		end,
	},
	{
		"folke/snacks.nvim",
		---@type snacks.Config
		opts = {
			indent = {
				animate = {
					enabled = false,
				},
				scope = {
					enabled = true,
					hl = highlight,
				},
			},
		},
	},
}
