return {
	{
		"folke/lazy.nvim",
		keys = {
			{ "<leader>pa", ":Lazy update<cr>" },
			{ "<leader>pl", ":Lazy<cr>" },
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		keys = {
			{ "<leader>pa", ":Lazy update<cr>" },
			{ "<leader>pl", ":Lazy<cr>" },
			{ "<leader>pm", ":Mason<cr>" },
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
}
