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
				{
					"<leader>bo",
					"<cmd>tabfirst | tabonly<cr>",
					desc = "Alle Tabs außer dem ersten schließen",
					silent = true,
				},
				{ "<C-W>t", "<cmd>tabclose<cr>", desc = "Tab schließen", silent = true },
				{ "]b", "<cmd>BufferNext<cr>", mode = { "n", "t" }, desc = "Nächster Puffer", silent = true },
				{ "[b", "<cmd>BufferPrevious<cr>", mode = { "n", "t" }, desc = "Vorheriger Puffer", silent = true },
				{ "<leader>c", "<cmd>BufferClose<cr>", desc = "Puffer schließen", silent = true },
				{ buffer_prefix .. "b", "<cmd>BufferPick<cr>", desc = "Puffer auswählen", silent = true },
				{ buffer_prefix .. "c", "<cmd>BufferPickDelete<cr>", desc = "Puffer zum Schließen auswählen", silent = true },
				{ "<leader>u", "<cmd>BufferRestore<cr>", desc = "Geschlossenen Puffer wiederherstellen", silent = true },
				{ buffer_prefix .. "N", "<cmd>BufferOrderByBufferName<cr>", desc = "Nach Puffername sortieren", silent = true },
				{ buffer_prefix .. "D", "<cmd>BufferOrderByDirectoryName<cr>", desc = "Nach Verzeichnis sortieren", silent = true },
				{ buffer_prefix .. "n", "<cmd>BufferOrderByName<cr>", desc = "Nach Name sortieren", silent = true },
				{ buffer_prefix .. "c", "<cmd>BufferCloseAllButCurrent<cr>", desc = "Alle anderen Puffer schließen", silent = true },
				{ buffer_prefix .. "r", "<cmd>BufferCloseBuffersRight<cr>", desc = "Puffer rechts schließen", silent = true },
				{ buffer_prefix .. "l", "<cmd>BufferCloseBuffersLeft<cr>", desc = "Puffer links schließen", silent = true },
				{ buffer_prefix .. "C", "<cmd>BufferWipeout<cr>", desc = "Puffer vollständig entfernen", silent = true },
				{ buffer_prefix .. "p", "<cmd>BufferPin<cr>", desc = "Puffer anheften", silent = true },
			},
			opts = {
				animation = false,
			},
			version = "*",
		},
	},
}
