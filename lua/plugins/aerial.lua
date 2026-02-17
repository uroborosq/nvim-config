return {
	{
		"stevearc/aerial.nvim",
		keys = {
			{ "<Leader>lS", ":AerialToggle<cr>", desc = "LSP Symbolen offnen" },
			{ "]y", ":AerialNext<cr>", desc = "das nächste Symbol" },
			{ "[y", ":AerialPrev<cr>", desc = "das vorheriges Symbol" },
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
