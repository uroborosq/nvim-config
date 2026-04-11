return {
	{
		"folke/lazy.nvim",
		keys = {
			{ "<leader>pa", "<cmd>Lazy update<cr>", silent = true },
			{ "<leader>pl", "<cmd>Lazy<cr>", silent = true },
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		keys = {
			{ "<leader>pa", "<cmd>Lazy update<cr>", silent = true },
			{ "<leader>pl", "<cmd>Lazy<cr>", silent = true },
			{ "<leader>pm", "<cmd>Mason<cr>", silent = true },
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
}
