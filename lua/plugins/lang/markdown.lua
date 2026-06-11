return {
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_browserfunc = "OpenMarkdownPreview"

			vim.cmd([[
function OpenMarkdownPreview(url)
  execute "silent ! chromium --app=" . a:url . " --class=nvim-preview --user-data-dir=/tmp/nvim-preview &"
endfunction
]])
			vim.g.mkdp_filetypes = { "markdown" }
			vim.g.mkdp_auto_close = 0
			-- vim.g.mkdp_browser = "/usr/bin/chromium"
		end,
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		keys = {
			{ "<Leader>mo", "<cmd>MarkdownPreview<cr>", desc = "Open markdown webview", silent = true },
			{ "<Leader>mc", "<cmd>MarkdownPreviewStop<cr>", desc = "Close markdown webview", silent = true },
		},

		ft = { "markdown" },
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
