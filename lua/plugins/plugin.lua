return {
	{
		"folke/lazy.nvim",
		keys = {
			{ "<leader>pa", "<cmd>Lazy update<cr>", desc = "Plugins aktualisieren", silent = true },
			{ "<leader>pl", "<cmd>Lazy<cr>", desc = "Plugin-Manager öffnen", silent = true },
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		keys = {
			{ "<leader>pa", "<cmd>Lazy update<cr>", desc = "Plugins aktualisieren", silent = true },
			{ "<leader>pl", "<cmd>Lazy<cr>", desc = "Plugin-Manager öffnen", silent = true },
			{ "<leader>pm", "<cmd>Mason<cr>", desc = "Mason öffnen", silent = true },
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
}
