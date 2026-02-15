return {
	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		keys = {
			{ "<Leader>mo", ":PeekOpen<CR>", desc = "Open markdown webview" },
			{ "<Leader>mc", ":PeekClose<CR>", desc = "Close markdown webview" },
		},
		config = function()
			require("peek").setup({})
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},
	{
		-- For `plugins/markview.lua` users.
		"OXY2DEV/markview.nvim",
		dependencies = {
			"Saghen/blink.cmp",
		},
		keys = {
			{ "<Leader>ms", ":Markview splitToggle<CR>", desc = "Toggle makrview split" },
		},
		lazy = false,
		opts = {},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				markdown = { "markdownlint-cli2" },
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		opts = {
			linters_by_ft = {
				markdown = { "markdownlint-cli2" },
			},
		},
	},
}
