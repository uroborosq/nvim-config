return {
	{ "wakatime/vim-wakatime" },
	{
		"fiqryq/wakastat.nvim",
		opts = {
			format = "Coding: %s", -- %s replaced with time
		},
		event = "VeryLazy",
		cmd = { "WakastatRefresh", "WakastatStatus" },
		-- specs = {
		-- 	{
		-- 		"rebelot/heirline.nvim",
		-- 		optional = true,
		-- 		opts = function(_, opts)
		-- 			opts.statusline = opts.statusline or {}
		-- 			table.insert(opts.statusline, 6, { -- insert at position 5
		-- 				provider = function()
		-- 					return " " .. require("wakastat").status() .. " "
		-- 				end,
		-- 				hl = "Wakastat",
		-- 				update = { "User", pattern = "WakastatUpdated" },
		-- 			})
		-- 		end,
		-- 	},
		-- },
	},
}
