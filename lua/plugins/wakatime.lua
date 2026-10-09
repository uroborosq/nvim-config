return {
	{
		"wakatime/vim-wakatime",
		-- enabled = false,
		-- плагин сам добавляет свой компонент в lualine_x; статистика выводится через wakastat
		opts = { status_bar_enabled = false },
	},
	{
		"fiqryq/wakastat.nvim",
		-- enabled = true,
		event = "VeryLazy",
		cmd = { "WakastatRefresh", "WakastatStatus" },
		opts = {
			format = "Codierungszeit: %s",
			args = { "--today", "--today-hide-categories" },
		},
	},
}
