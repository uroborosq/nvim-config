return {
	{
		"stevearc/aerial.nvim",
		keys = {
			{ "<Leader>lS", "<cmd>AerialToggle<cr>", desc = "LSP Symbolen offnen", silent = true },
			{ "]y", "<cmd>AerialNext<cr>", desc = "das nächste Symbol", silent = true },
			{ "[y", "<cmd>AerialPrev<cr>", desc = "das vorheriges Symbol", silent = true },
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
