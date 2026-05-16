return {
	{
		"rcarriga/nvim-notify",
		opts = {
			background_colour = "#00000000",
		},
		config = function(_, opts)
			require("notify").setup(opts)
			vim.notify = require("notify")
		end,
	},
}
