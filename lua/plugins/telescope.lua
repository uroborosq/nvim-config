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
				{ search_prefix, group = "search" },
				{ search_prefix .. "f", builtin.find_files, desc = "Dateien suchen" },
				{ search_prefix .. "o", builtin.oldfiles, desc = "zuletzt verwendete Dateien" },
				{ search_prefix .. "k", builtin.keymaps, desc = "Keymaps finden" },
				{ search_prefix .. "b", builtin.buffers, desc = "Buffers finden" },
				{ search_prefix .. "w", builtin.live_grep, desc = "Worte suchen" },
				{ search_prefix .. "t", builtin.colorscheme, desc = "Farbschema" },
				{ search_prefix .. "n", ":Telescope notify<cr>", desc = "Benachrichtigungen" },
				{ lang_prefix .. "s", ":Telescope aerial<cr>", desc = "LSP Symbolen suchen" },
				{ lang_prefix .. "R", builtin.lsp_references, desc = "LSP Symbolen suchen" },
				{ lang_prefix .. "D", builtin.diagnostics, desc = "LSP Probleme sehen" },
				{ lang_prefix .. "R", builtin.lsp_references, desc = "LSP References suchen" },
				{ "gy", builtin.lsp_type_definitions, desc = "LSP definitions suchen" },
				{ lang_prefix .. "i", builtin.lsp_implementations, desc = "LSP Implementations suchen" },
				{ lang_prefix .. "G", builtin.lsp_dynamic_workspace_symbols, desc = "LSP Workspace Symbolen suchen" },
				{ lang_prefix .. "r", vim.lsp.buf.rename, desc = "LSP symbol rename" },
				{ "gd", builtin.lsp_definitions, desc = "zu Definition gehen" },
				{ lang_prefix .. "I", vim.lsp.buf.typehierarchy, desc = "LSP symbol ierarcchy" },
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
					},
				},
			})
			require("telescope").load_extension("aerial")
			require("telescope").load_extension("ui-select")
		end,
	},
}
