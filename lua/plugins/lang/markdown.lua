return {
	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup({})
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},
	{
		-- For `plugins/markview.lua` users.
		"OXY2DEV/markview.nvim",
		lazy = false,
		opts = {
			-- preview = {
			--   enabled = true,
			--   splitview_winopts = {
			--     split = "right",
			--   },
			-- },
		},
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
	{
		"AstroNvim/astrocore",
		---@type AstroCoreOpts
		opts = {
			mappings = {
				n = {
					["<Leader>ms"] = { ":Markview splitToggle<CR>", desc = "Toggle makrview split" },
					["<Leader>mo"] = { ":PeekOpen<CR>", desc = "Open markdown webview" },
					["<Leader>mc"] = { ":PeekClose<CR>", desc = "Close markdown webview" },
					["<Leader>mh"] = {
						function()
							require("diagram").show_diagram_hover()
						end,
						desc = "Show diagram hover",
					},
				},
			},
		},
	},
}
