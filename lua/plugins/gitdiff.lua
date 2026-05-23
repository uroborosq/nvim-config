return {
	{
		"sindrets/diffview.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"folke/which-key.nvim",
		},
		config = function()
			require("which-key").add({
				{ "<leader>gd", ":DiffviewOpen<CR>", desc = "Git diff view open" },
				{ "<leader>gD", ":DiffviewClose<CR>", desc = "Git diff view close" },
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
					desc = "Close ALL Diffview tabs",
				},
				{ "<leader>gc", ":DiffviewFileHistory %<CR>", desc = "Git file history" },
				{ "<leader>gb", ":DiffviewOpen ", desc = "Git diff with branch" },
				{ "<leader>gm", ":DiffviewOpen main<CR>", desc = "Git diff with main" },
				{ "<leader>gC", ":DiffviewFileHistory<CR>", desc = "Git repo history" },
			})
		end,
	},
}
