local function wakastat()
	return require("wakastat").status()
end

local selectioncount = {
	function()
		local starts = vim.fn.line("v")
		local ends = vim.fn.line(".")
		local lines = starts <= ends and ends - starts + 1 or starts - ends + 1
		return " " .. tostring(lines) .. " lines " .. tostring(vim.fn.wordcount().visual_chars) .. " chars"
	end,
	cond = function()
		-- return true
		local m = vim.fn.mode()
		return m == "V" or m == "v"
	end,
}

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"fiqryq/wakastat.nvim",
		},
		event = "VeryLazy",
		init = function()
			vim.o.laststatus = 3
			vim.o.cmdheight = 0
		end,
		opts = {
			always_show_tabline = false,
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return str:sub(1, 1)
						end,
					},
				},
				lualine_b = { "branch", "diagnostics" },
				lualine_c = { wakastat },
				lualine_x = { selectioncount, "searchcount" },
				lualine_y = { "encoding", "fileformat", "filetype" },
				lualine_z = { "location" },
			},
			options = {
				globalstatus = true,
				theme = "catppuccin",
			},
		},
	},
}
