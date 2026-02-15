local prefix = "<leader>g"
return {
	{
		"lewis6991/gitsigns.nvim",
		keys = {
			{
				"]g",
				function()
					require("gitsigns").nav_hunk("next")
				end,
			},
			{
				"[g",
				function()
					require("gitsigns").nav_hunk("prev")
				end,
			},
			{
				prefix .. "l",
				function()
					require("gitsigns").blame_line({ full = true })
				end,
			},
			{
				prefix .. "r",
				function()
					require("gitsigns").reset_hunk()
				end,
			},
			{
				prefix .. "s",
				function()
					require("gitsigns").state_hunk()
				end,
			},
			{
				prefix .. "B",
				function()
					require("gitsigns").blame()
				end,
			},
		},
		opts = {},
	},
}
