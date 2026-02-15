vim.o.laststatus = 3
return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		opts = {
			-- tabline = {
			-- 	lualine_b = { "buffers" },
			-- 	lualine_c = {},
			-- 	lualine_x = {},
			-- 	lualine_y = {},
			-- 	lualine_z = {},
			-- 	lualine_a = { "tabs" },
			-- },
			options = {
				globalstatus = true,
				theme = "catppuccin",
			},
		},
	},
}
