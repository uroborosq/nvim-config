return {
	{
		"b0o/schemastore.nvim",
		optional = true,
		specs = {
			"neovim/nvim-lspconfig",
			opts = function(_, _)
				vim.lsp.config("jsonls", {
					settings = {
						json = {
							schemas = require("schemastore").json.schemas(),
							validate = { enable = true },
						},
					},
					init_options = {
						provideFormatter = true,
					},
				})
			end,
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				json = "json",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			opts.ensure_installed = vim.list_extend(opts.ensure_installed, { "json-lsp" })
		end,
	},
}
