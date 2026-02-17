return {
	{
		"b0o/schemastore.nvim",
		optional = true,
		specs = {
			"neovim/nvim-lspconfig",
			opts = function(_, _)
				vim.lsp.config("yamlls", {
					settings = {
						yaml = {
							schemas = require("schemastore").yaml.schemas(),
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
				yaml = "yaml",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			opts.ensure_installed = vim.list_extend(opts.ensure_installed, { "yaml-language-server" })
		end,
	},
}
