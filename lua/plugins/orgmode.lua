return {
	{
		"neovim/nvim-lspconfig",
		opts = function(_, _)
			vim.lsp.config("org", { filetypes = {} })
			vim.lsp.enable("org")
		end,
	},
	{
		"nvim-orgmode/orgmode",
		opts = {
			org_agenda_files = "~/docs/orgfiles/**/*",
			org_default_notes_file = "~/docs/orgfiles/refile.org",
		},
	},
}
