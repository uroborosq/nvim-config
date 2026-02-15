return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {
			bash = "bash",
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			opts.ensure_installed = vim.list_extend(
				opts.ensure_installed,
				{ "bash-language-server", "shellcheck", "shfmt", "bash-debug-adapter" }
			)
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = function(_, _)
			vim.lsp.config("bashls", {
				settings = {
					bashls = {
						filetypes = { "sh", "bash", "zsh" },
					},
				},
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		optional = true,
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}

			opts.ensure_installed = vim.list_extend(opts.ensure_installed, { "shfmt", "shellcheck" })
			if opts.handlers then
				opts.handlers.shfmt = function() end
			end
		end,
	},
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				sh = { "shfmt", "shellcheck" },
				zsh = { "shfmt", "shellcheck" },
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		optional = true,
		opts = {
			linters_by_ft = {
				sh = { "shellcheck" },
				zsh = { "shellcheck" },
			},
		},
	},
}
