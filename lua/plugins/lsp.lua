return {

	{
		"neovim/nvim-lspconfig",
		keys = {
			{
				"<Leader>ld",
				function()
					vim.diagnostic.open_float({ source = true })
				end,
				desc = "Diagnose der Zeile anzeigen",
			},
			{
				"<Leader>uh",
				function()
					-- Zustand des aktuellen Puffers: LspAttach aktiviert die Hinweise pro Puffer,
					-- das globale Flag bleibt dabei ausgeschaltet.
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }))
				end,
				desc = "Inlay-Hinweise umschalten",
			},
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client and client:supports_method("textDocument/inlayHint") then
						vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
					end
				end,
			})
		end,
	},
}
