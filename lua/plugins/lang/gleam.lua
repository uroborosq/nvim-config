local has_gleam = vim.fn.executable("gleam") == 1

return {
	{
		"nvim-treesitter/nvim-treesitter",
		cond = has_gleam,
		opts = {
			ensure_installed = { gleam = "gleam" },
		},
	},
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				gleam = { "gleam" },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		cond = has_gleam,
		opts = function(_, _)
			vim.lsp.enable("gleam")
		end,
	},
}
