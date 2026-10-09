return {
	{
		"stevearc/aerial.nvim",
		keys = {
			{ "<Leader>lS", "<cmd>AerialToggle<cr>", desc = "Symbolübersicht umschalten", silent = true },
			{ "]y", "<cmd>AerialNext<cr>", desc = "Nächstes Symbol", silent = true },
			{ "[y", "<cmd>AerialPrev<cr>", desc = "Vorheriges Symbol", silent = true },
		},
		opts = {
			backends = {
				go = { "treesitter" },
			},
			layout = {
				default_direction = "prefer_left",
				placement = "edge",
				resize_to_content = false,
				preserve_equality = true,
				max_width = nil,
				width = nil,
				min_width = nil,
			},
		},
	},
}
