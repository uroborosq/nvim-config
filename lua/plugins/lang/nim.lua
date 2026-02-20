return {
	{
		"neovim/nvim-lspconfig",
		optional = true,
		opts = function(_, _)
			vim.lsp.config("nim_langserver", {})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			opts.ensure_installed = vim.list_extend(opts.ensure_installed, { "nim_langserver" })
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				nim = "nim",
				nim_format_string = "nim_format_string",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		optional = true,
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			opts.ensure_installed = vim.list_extend(opts.ensure_installed, {
				"nimlangserver",
			})
		end,
	},
}
