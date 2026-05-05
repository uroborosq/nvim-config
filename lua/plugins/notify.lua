return {
	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>nc",
				function()
					require("notify").clear_history()
				end,
				desc = "Benachrichtigungsverlauf löschen",
				silent = true,
			},
		},
		opts = {
			background_colour = "#00000000",
		},
		config = function(_, opts)
			require("notify").setup(opts)
			vim.notify = require("notify")
		end,
	},
}
