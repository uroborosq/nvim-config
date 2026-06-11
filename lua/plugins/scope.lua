return {
	{
		"tiagovla/scope.nvim",
		event = "VeryLazy",
		config = function()
			require("scope").setup({
				hooks = {
					-- damit barbar Reihenfolge und Pins der Buffer beim Tabwechsel behält
					pre_tab_leave = function()
						vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabLeavePre" })
					end,
					post_tab_enter = function()
						vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabEnterPost" })
					end,
				},
			})
			require("telescope").load_extension("scope")
		end,
	},
}
