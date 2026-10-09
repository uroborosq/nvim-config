local search_prefix = "<Leader>f"
local lang_prefix = "<Leader>l"

return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
		opts = {},
	},
	{

		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"stevearc/aerial.nvim",
			"folke/which-key.nvim",
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function(_, opts)
			local builtin = require("telescope.builtin")
			local action = require("telescope.actions")

			require("which-key").add({
				{ search_prefix, group = "Suchen" },
				{
					search_prefix .. "m",
					function()
						builtin.find_files({
							find_command = {
								"fd",
								"--type",
								"f",
								"-e",
								"md",
								"--hidden",
								"--exclude",
								".git",
							},
						})
					end,
					desc = "Markdown-Dateien suchen",
				},
				{
					search_prefix .. "g",
					function()
						builtin.find_files({
							find_command = {
								"fd",
								"--type",
								"f",
								"-e",
								"go",
								"--hidden",
								"--exclude",
								".git",
							},
						})
					end,
					desc = "Go-Dateien suchen",
				},
				{ search_prefix .. "f", builtin.find_files, desc = "Dateien suchen" },
				{ search_prefix .. "o", builtin.oldfiles, desc = "Zuletzt verwendete Dateien" },
				{ search_prefix .. "k", builtin.keymaps, desc = "Tastenbelegungen suchen" },
				{
					search_prefix .. "b",
					function()
						require("telescope").extensions.scope.buffers()
					end,
					desc = "Puffer suchen",
				},
				{ search_prefix .. "w", builtin.live_grep, desc = "Text suchen (Live-Grep)" },
				{ search_prefix .. "t", builtin.colorscheme, desc = "Farbschema wählen" },
				{ search_prefix .. "n", "<cmd>Telescope notify<cr>", desc = "Benachrichtigungen durchsuchen", silent = true },
				{ lang_prefix .. "s", "<cmd>Telescope aerial<cr>", desc = "Symbole suchen (Aerial)", silent = true },
				{ lang_prefix .. "D", builtin.diagnostics, desc = "Diagnosen anzeigen" },
				{ lang_prefix .. "R", builtin.lsp_references, desc = "Referenzen suchen" },
				{ search_prefix .. "<cr>", builtin.resume, desc = "Letzte Suche fortsetzen" },
				{ "gy", builtin.lsp_type_definitions, desc = "Zur Typdefinition gehen" },
				{ "gri", builtin.lsp_implementations, desc = "Implementierungen suchen" },
				{ lang_prefix .. "i", builtin.lsp_implementations, desc = "Implementierungen suchen" },
				{ lang_prefix .. "G", builtin.lsp_dynamic_workspace_symbols, desc = "Workspace-Symbole suchen" },
				-- { lang_prefix .. "r", vim.lsp.buf.rename, desc = "LSP symbol rename" },
				{ "gd", builtin.lsp_definitions, desc = "Zur Definition gehen" },
				{ lang_prefix .. "I", vim.lsp.buf.typehierarchy, desc = "Typhierarchie anzeigen" },
			})

			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-j>"] = action.move_selection_next,
							["<C-k>"] = action.move_selection_previous,
							["<C-f>"] = action.preview_scrolling_left,
							["<C-b>"] = action.preview_scrolling_right,
						},
					},
				},
				extensions = {
					["ui-select"] = {},
				},
				pickers = {
					find_files = {
						hidden = true,
						find_command = {
							"fd",
							"--type",
							"f",
							"--hidden",
							"--exclude",
							".git",
						},
					},
				},
			})
			require("telescope").load_extension("aerial")
			require("telescope").load_extension("ui-select")
		end,
	},
}
