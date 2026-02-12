return {
	{
		"rcarriga/nvim-notify",
		config = function(_, opts)
			require("notify").setup(opts)
			vim.notify = require("notify")
		end,
	},
}
