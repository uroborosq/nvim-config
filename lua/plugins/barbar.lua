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
				{ "]]", ":tabnext<cr>", desc = "das Nachtest Tab" },
				{ "[[", ":tabprev<cr>", desc = "ver" },
				{ "<C-W>t", ":tabclose<cr>" },
				{ "]b", ":BufferNext<cr>" },
				{ "[b", ":BufferPrevious<cr>" },
				{ "<leader>c", ":BufferClose<cr>" },
				{ buffer_prefix .. "b", ":BufferPick<cr>" },
				{ buffer_prefix .. "c", ":BufferPickDelete<cr>" },
				{ "<leader>u", ":BufferRestore<cr>" },
				{ buffer_prefix .. "N", ":BufferOrderByBufferName<cr>" },
				{ buffer_prefix .. "D", ":BufferOrderByDirectoryName<cr>" },
				{ buffer_prefix .. "n", ":BufferOrderByName<cr>" },
				{ buffer_prefix .. "c", ":BufferCloseAllButCurrent<cr>" },
				{ buffer_prefix .. "r", ":BufferCloseBuffersRight<cr>" },
				{ buffer_prefix .. "l", ":BufferCloseBuffersLeft<cr>" },
				{ buffer_prefix .. "C", ":BufferWipeout<cr>" },
				{ buffer_prefix .. "p", ":BufferPin<cr>" },
			},
			opts = {
				animation = false,
			},
			version = "*",
		},
	},
}
