return {
	{
		"wakatime/vim-wakatime",
		enabled = false,
	},
	{
		"fiqryq/wakastat.nvim",
		enabled = false,
		event = "VeryLazy",
		cmd = { "WakastatRefresh", "WakastatStatus" },
		opts = {
			format = "Codierungszeit: %s",
			args = { "--today", "--today-hide-categories" },
		},
	},
}
