return {
	{
		"neovim/nvim-lspconfig",
		opts = function()
			vim.lsp.config("nim_langserver", {
				settings = {
					nim = {
						useNimCheck = true,
						autoCheckFile = true,
						autoCheckProject = true,
						checkOnSave = true,
					},
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				nim = { "nimpretty" },
			},
			formatters = {
				nimpretty = {
					prepend_args = { "--indent:2" },
				},
			},
		},
	},
}
