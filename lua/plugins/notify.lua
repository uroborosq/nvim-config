return {
	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>nc",
				function()
					pcall(function()
						vim.cmd("NoiceDismiss")
					end)
					pcall(function()
						require("notify").dismiss({ silent = true, pending = true })
					end)
				end,
				desc = "Benachrichtigungen schließen",
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
