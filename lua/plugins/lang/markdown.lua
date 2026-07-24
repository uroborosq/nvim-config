return {
	{
		"uroborosq/uq-markdown",
		ft = { "markdown" },
		keys = {
			{ "<Leader>mo", "<cmd>MdPreviewToggle<cr>", desc = "Toggle markdown webview", silent = true },
		},
	},
	{
		"OXY2DEV/markview.nvim",
		dependencies = {
			"Saghen/blink.cmp",
			"saghen/blink.cmp",
		},
		init = function()
			vim.g.markview_cmp_loaded = true
		end,
		keys = {
			{ "<Leader>ms", "<cmd>Markview splitToggle<cr>", desc = "Toggle makrview split", silent = true },
		},
		lazy = false,
		opts = function(_, opts)
			local presets = require("markview.presets").horizontal_rules

			opts.markdown = {
				horizontal_rules = presets.thin,
			}
		end,
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
