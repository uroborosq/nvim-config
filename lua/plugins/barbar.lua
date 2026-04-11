local buffer_prefix = "<leader>b"
return {
	{
		{
			"romgrk/barbar.nvim",
			dependencies = {
				"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
				"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
			},
			init = function()
				-- vim.g.barbar_auto_setup = false
			end,
			event = { "BufWinEnter" },
			keys = {
				{ "<C-W>t", "<cmd>tabclose<cr>", silent = true },
				{ "]b", "<cmd>BufferNext<cr>", silent = true },
				{ "[b", "<cmd>BufferPrevious<cr>", silent = true },
				{ "<leader>c", "<cmd>BufferClose<cr>", silent = true },
				{ buffer_prefix .. "b", "<cmd>BufferPick<cr>", silent = true },
				{ buffer_prefix .. "c", "<cmd>BufferPickDelete<cr>", silent = true },
				{ "<leader>u", "<cmd>BufferRestore<cr>", silent = true },
				{ buffer_prefix .. "N", "<cmd>BufferOrderByBufferName<cr>", silent = true },
				{ buffer_prefix .. "D", "<cmd>BufferOrderByDirectoryName<cr>", silent = true },
				{ buffer_prefix .. "n", "<cmd>BufferOrderByName<cr>", silent = true },
				{ buffer_prefix .. "c", "<cmd>BufferCloseAllButCurrent<cr>", silent = true },
				{ buffer_prefix .. "r", "<cmd>BufferCloseBuffersRight<cr>", silent = true },
				{ buffer_prefix .. "l", "<cmd>BufferCloseBuffersLeft<cr>", silent = true },
				{ buffer_prefix .. "C", "<cmd>BufferWipeout<cr>", silent = true },
				{ buffer_prefix .. "p", "<cmd>BufferPin<cr>", silent = true },
			},
			opts = {
				animation = false,
			},
			version = "*",
		},
	},
}
