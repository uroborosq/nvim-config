return {
	{ "wakatime/vim-wakatime" },
	{
		"fiqryq/wakastat.nvim",
		opts = {
			format = "%s", -- %s replaced with time
		},
		event = "VeryLazy",
		cmd = { "WakastatRefresh", "WakastatStatus" },
	},
}
