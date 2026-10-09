return {
	{
		"sindrets/diffview.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"folke/which-key.nvim",
		},
		config = function()
			vim.opt.diffopt = {
				"internal",
				"filler",
				"closeoff",
				"algorithm:histogram",
				"indent-heuristic",
				"linematch:60",
				"inline:char",
			}

			require("diffview").setup({
				enhanced_diff_hl = true,
				hooks = {
					diff_buf_win_enter = function(_, winid)
						vim.wo[winid].wrap = true
					end,
				},
			})

			require("which-key").add({
				{ "<leader>gd", ":DiffviewOpen<CR>", desc = "Diffview öffnen" },
				{ "<leader>gD", ":DiffviewClose<CR>", desc = "Diffview schließen" },
				{
					"<leader>gX",
					function()
						local lib = require("diffview.lib")
						local views = {}
						for _, view in ipairs(lib.views) do
							views[#views + 1] = view
						end
						for _, view in ipairs(views) do
							pcall(function()
								view:close()
							end)
						end
					end,
					desc = "Alle Diffview-Tabs schließen",
				},
				{ "<leader>gc", ":DiffviewFileHistory %<CR>", desc = "Dateiverlauf" },
				{ "<leader>gb", ":DiffviewOpen ", desc = "Diff mit Branch" },
				{ "<leader>gm", ":DiffviewOpen main<CR>", desc = "Diff mit main" },
				{ "<leader>gC", ":DiffviewFileHistory<CR>", desc = "Repository-Verlauf" },
			})
		end,
	},
}
