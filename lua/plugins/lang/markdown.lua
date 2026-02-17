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
			"saghen/blink.cmp",
		},
		init = function()
			vim.g.markview_cmp_loaded = true
		end,
		keys = {
			{ "<Leader>ms", ":Markview splitToggle<CR>", desc = "Toggle makrview split" },
		},
		lazy = false,
		opts = function() end,
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
