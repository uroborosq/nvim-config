local ignoring_code_actions = {
	["source.doc"] = true,
	["source.assembly"] = true,
	["source.test"] = true,
	["gopls.doc.features"] = true,
	["source.addTest"] = true,
	["source.toggleCompilerOptDetails"] = true,
	["source.splitPackage"] = true,
}

--- @argument action lsp.CodeAction|lsp.Command
--- @return boolean
local function is_gopls(action)
	if not (action.command == nil) then
		if not (action.command.command == nil) then
			if not (action.command.command:find("gopls") == nil) then
				return true
			end
		end
	end

	if not (action.data == nil) then
		if not (action.data.command == nil) then
			if not (action.data.command:find("gopls") == nil) then
				return true
			end
		end
	end
	return false
end

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = {
			-- Gruppen
			{
				mode = { "n", "x" },
				{ "<leader>a", group = "KI / Claude Code" },
				{ "<leader>b", group = "Puffer" },
				{ "<leader>f", group = "Suchen" },
				{ "<leader>g", group = "Git" },
				{ "<leader>G", group = "Golang" },
				{ "<leader>h", group = "Harpoon" },
				{ "<leader>l", group = "LSP" },
				{ "<leader>m", group = "Markdown" },
				{ "<leader>n", group = "Mehrfachcursor / Benachrichtigungen" },
				{ "<leader>p", group = "Plugins" },
				{ "<leader>r", group = "Pull-Requests" },
				{ "<leader>s", group = "Suchen und Ersetzen" },
				{ "<leader>S", group = "Sitzungen" },
				{ "<leader>t", group = "Tests" },
				{ "<leader>tc", group = "Testabdeckung" },
				{ "<leader>u", group = "Oberfläche umschalten" },
				{ "<leader>y", group = "Hierarchien (Yarn)" },
				{ "<localleader>t", group = "Aufgaben" },
				{ "[", group = "Vorherige" },
				{ "]", group = "Nächste" },
				{ "g", group = "Gehe zu" },
				{ "z", group = "Faltung und Ansicht" },
				{ "<c-w>", group = "Fenster" },
			},
			{
				mode = { "o", "x" },
				{ "a", group = "Um (außen)" },
				{ "i", group = "Innerhalb" },
			},
			-- Belegungen, die Plugins selbst anlegen: hier nur die Beschriftung
			{ "<leader>/", desc = "Kommentar umschalten", mode = { "n", "x" } },
			{ "<leader>lr", desc = "Umbenennen (Go-Methode über Interfaces, sonst LSP)" },
			{ "<leader>rC", desc = "Pull-Request erstellen" },
			{ "<leader>rm", desc = "Pull-Request mergen" },
			{ "<leader>rq", desc = "Pull-Request schließen" },
			{ "<leader>rS", desc = "Pull-Request-Statistik" },
			{ "<leader>tr", desc = "Letzte Aufgabe erneut ausführen" },
			{
				mode = { "n" },
				{
					"<leader>lF",
					function()
						vim.cmd("write")
						local file = vim.fn.expand("%:p")
						local cmd = { "golangci-lint", "run", "--fix", file }

						vim.fn.jobstart(cmd, {
							stderr_buffered = true,
							on_stderr = function(_, data)
								if data and #data > 1 then
									vim.notify(table.concat(data, "\n"), vim.log.levels.WARN)
								end
							end,
							on_exit = function()
								vim.notify("golangci-lint --fix done")
								vim.cmd("<cmd>e<br>")
							end,
						})
					end,
					desc = "golangci-lint --fix für aktuelle Datei",
				},

				{ "<leader>Gc", "<cmd>GoCmt<CR>", desc = "Kommentar generieren", silent = true },
				{ "<leader>Ge", "<cmd>GoIfErr<CR>", desc = "if err generieren", silent = true },
				{ "<leader>Gd", "<cmd>GoMod tidy<CR>", desc = "go mod tidy ausführen", silent = true },
				{ "<leader>Gg", "<cmd>GoGenerate %<CR>", desc = "go generate für aktuelle Datei", silent = true },
				{ "<leader>GG", "<cmd>GoGenerate<CR>", desc = "go generate für alles", silent = true },

				-- без <CR>, чтобы вводить аргументы
				{ "<leader>Gi", "<cmd>GoImpl ", desc = "Interface implementieren" },
				{ "<leader>GI", "<cmd>GoMod init ", desc = "go mod init ausführen" },

				{ "<leader>Ga", "<cmd>GoTagAdd json<CR>", desc = "JSON-Tags zum Struct hinzufügen", silent = true },

				{ "<leader>Gt", "<cmd>GoTestAdd<CR>", desc = "Tests für aktuelle Methode generieren", silent = true },
				{ "<leader>GT", "<cmd>GoTestsExp<CR>", desc = "Tests für exportierte Methoden generieren", silent = true },
			},
			{
				mode = { "i" },
				{ "<C-E>", "<esc><cmd>GoIfErr<CR>i", desc = "if err generieren", silent = true },
			},
			{
				{
					"<leader>lc",
					function()
						require("telescope.builtin").lsp_incoming_calls()
					end,
					desc = "Eingehende Aufrufe",
					mode = "n",
				},
				{
					"<leader>lC",
					function()
						require("telescope.builtin").lsp_outgoing_calls()
					end,
					desc = "Ausgehende Aufrufe",
					mode = "n",
				},
				{
					"<leader>lA",
					function()
						vim.lsp.buf.code_action()
					end,
					desc = "Alle Code-Aktionen anzeigen",
					mode = "n",
				},
				{
					"<leader>lu",
					"<cmd>lsp restart<CR>",
					desc = "LSP neu starten",
					silent = true,
					mode = "n",
				},
				{
					"<leader>la",
					function()
						vim.lsp.buf.code_action({
							filter = function(action)
								local gopls_detected = is_gopls(action)
								if gopls_detected and ignoring_code_actions[action.kind] then
									return false
								end
								return true
							end,
						})
					end,
					desc = "Code-Aktionen anzeigen",
					mode = "n",
				},
			},
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Puffer-lokale Tastenbelegungen",
		},
	},
}
