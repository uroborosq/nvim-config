return {
	{
		"tiagovla/scope.nvim",
		event = "VeryLazy",
		config = function()
			require("scope").setup({
				hooks = {
					-- damit barbar Reihenfolge und Pins der Buffer beim Tabwechsel behält.
					-- Nicht während eine Sitzung geladen wird: barbar löscht bei ScopeTabEnterPost
					-- alle leeren Buffer, darunter die Platzhalter aus `tabnew` der Sitzungsdatei,
					-- und schließt damit die gerade angelegten Tabs.
					pre_tab_leave = function()
						if vim.g.SessionLoad then
							return
						end
						vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabLeavePre" })
					end,
					post_tab_enter = function()
						if vim.g.SessionLoad then
							return
						end
						vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabEnterPost" })
					end,
				},
			})
			require("telescope").load_extension("scope")
		end,
	},
}
