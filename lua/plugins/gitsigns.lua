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
				desc = "Nächster Hunk",
			},
			{
				"[g",
				function()
					require("gitsigns").nav_hunk("prev")
				end,
				desc = "Vorheriger Hunk",
			},
			{
				prefix .. "l",
				function()
					require("gitsigns").blame_line({ full = true })
				end,
				desc = "Blame der Zeile anzeigen",
			},
			{
				prefix .. "r",
				function()
					require("gitsigns").reset_hunk()
				end,
				desc = "Hunk zurücksetzen",
			},
			{
				prefix .. "s",
				function()
					require("gitsigns").state_hunk()
				end,
				desc = "Hunk stagen",
			},
			{
				prefix .. "B",
				function()
					require("gitsigns").blame()
				end,
				desc = "Blame der Datei anzeigen",
			},
		},
		opts = {},
	},
}
