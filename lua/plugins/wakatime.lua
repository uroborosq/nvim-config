return {
	{
		"wakatime/vim-wakatime",
	},
	{
		"fiqryq/wakastat.nvim",
		event = "VeryLazy",
		cmd = { "WakastatRefresh", "WakastatStatus" },
		opts = {
			format = "Codierungszeit: %s",
			args = { "--today", "--today-hide-categories" },
		},
	},
}
