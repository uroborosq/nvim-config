local has_nim = vim.fn.executable("nim") == 1

return {
	{
		"neovim/nvim-lspconfig",
		cond = has_nim,
		optional = true,
		opts = function(_, _)
			vim.lsp.config("nim_langserver", {})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		cond = has_nim,
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			opts.ensure_installed = vim.list_extend(opts.ensure_installed, { "nim_langserver" })
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		cond = has_nim,
		opts = {
			ensure_installed = {
				nim = "nim",
				nim_format_string = "nim_format_string",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		cond = has_nim,
		optional = true,
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			opts.ensure_installed = vim.list_extend(opts.ensure_installed, {
				"nimlangserver",
			})
		end,
	},
}
