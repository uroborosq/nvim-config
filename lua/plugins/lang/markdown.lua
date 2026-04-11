function OpenMarkdownPreview(url)
	vim.cmd("! open -a Firefox -n --args --new-window " .. url)
end

return {
	-- {
	-- 	"iamcco/markdown-preview.nvim",
	-- 	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	-- 	build = "cd app && npm install",
	-- 	keys = {
	-- 		{ "<Leader>mo", "<cmd>MarkdownPreview<cr>", desc = "Open markdown webview" },
	-- 		{ "<Leader>mc", "<cmd>MarkdownPreviewStop<cr>", desc = "Close markdown webview" },
	-- 	},
	-- 	init = function()
	-- 		-- vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
	-- 		vim.g.mkdp_browser = "chromium"
	-- 		vim.g.mkdp_filetypes = { "markdown" }
	-- 	end,
	-- 	ft = { "markdown" },
	-- },
	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		keys = {
			{ "<Leader>mo", "<cmd>PeekOpen<cr>", desc = "Open markdown webview", silent = true },
			{ "<Leader>mc", "<cmd>PeekClose<cr>", desc = "Close markdown webview", silent = true },
		},
		config = function()
			require("peek").setup({
				app = "chromium",
			})
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
			{ "<Leader>ms", "<cmd>Markview splitToggle<cr>", desc = "Toggle makrview split", silent = true },
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
