return {
	{
		"Bekaboo/dropbar.nvim",
		-- optional, but required for fuzzy finder support
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		config = function()
			local dropbar_api = require("dropbar.api")
			vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Symbol in der Winbar wählen" })
			vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Zum Anfang des aktuellen Kontexts" })
			vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Nächsten Kontext auswählen" })
		end,
	},
}
