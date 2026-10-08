return {
	{
		"uroborosq/uq-markdown",
		ft = { "markdown" },
		keys = {
			{ "<Leader>mm", "<cmd>MdPreviewToggle<cr>", desc = "Toggle markdown webview", silent = true },
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
			{ "<Leader>mt", "<cmd>Markview toggle<cr>", desc = "Toggle markview rendering", silent = true },
			{
				"<LocalLeader><Space>",
				function()
					require("markview.extras.checkboxes").toggler.init()
					if vim.fn.mode():match("^[vV\22]") then
						vim.api.nvim_feedkeys(vim.keycode("<Esc>"), "n", false)
					end
				end,
				mode = { "n", "x" },
				ft = "markdown",
				desc = "Toggle markdown task",
				silent = true,
			},
			{
				"<Leader>mr",
				function()
					local actions = require("markview.actions")
					local buf = vim.api.nvim_get_current_buf()

					actions.detach(buf)
					actions.attach(buf)
				end,
				desc = "Reload markview",
				silent = true,
			},
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
