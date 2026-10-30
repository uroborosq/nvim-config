local search_prefix = "<Leader>f"
local lang_prefix = "<Leader>l"

-- Anzeigename eines Puffers: toggleterm-Name, Vordergrundprozess des Terminals oder Dateipfad
local function buf_label(buf)
	if vim.bo[buf].buftype == "terminal" then
		local tt = package.loaded["toggleterm.terminal"]
		local term = tt and tt.find(function(t)
			return t.bufnr == buf
		end)
		if term then
			return term.id .. ": " .. (term.display_name or vim.fn.fnamemodify(vim.split(term.name or "", ";")[1], ":t"))
		end
		return "term: " .. (require("config.terminal").foreground(buf) or "?")
	end
	local name = vim.api.nvim_buf_get_name(buf)
	return name == "" and "[Kein Name]" or vim.fn.fnamemodify(name, ":~:.")
end

-- Öffnet den n-ten Eintrag (1 = bester Treffer); gibt es weniger Einträge, passiert nichts
local function select_nth(n)
	return function(prompt_bufnr)
		local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
		if n > picker.manager:num_results() then
			return
		end
		picker:set_selection(picker:get_row(n))
		require("telescope.actions").select_default(prompt_bufnr)
	end
end

-- Flash-Labels an den Ergebniszeilen: Label drücken wählt den Eintrag und öffnet ihn sofort
local function flash(prompt_bufnr)
	require("flash").jump({
		pattern = "^.",
		label = { after = { 0, 0 } },
		search = {
			mode = "search",
			exclude = {
				function(win)
					return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
				end,
			},
		},
		action = function(match)
			local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
			picker:set_selection(match.pos[1] - 1)
			require("telescope.actions").select_default(prompt_bufnr)
		end,
	})
end

-- Picker für Neovim-Tabs: <CR> wechselt, <C-d> (bzw. d im Normalmodus) schließt den Tab
local function tab_picker()
	local actions = require("telescope.actions")
	local state = require("telescope.actions.state")
	local origin = vim.api.nvim_get_current_tabpage()
	-- im aktuellen Tab ist bei geöffnetem Picker dessen Prompt das aktive Fenster
	local origin_win = vim.api.nvim_get_current_win()

	local function make_finder()
		local results = {}
		for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
			local win = tab == origin and origin_win or vim.api.nvim_tabpage_get_win(tab)
			local buf = vim.api.nvim_win_get_buf(win)
			local wins = vim.tbl_filter(function(w)
				return vim.api.nvim_win_get_config(w).relative == ""
			end, vim.api.nvim_tabpage_list_wins(tab))
			table.insert(results, { tab = tab, buf = buf, label = buf_label(buf), wins = #wins })
		end
		return require("telescope.finders").new_table({
			results = results,
			entry_maker = function(item)
				local nr = vim.api.nvim_tabpage_get_number(item.tab)
				local mark = item.tab == origin and "%" or " "
				local extra = item.wins > 1 and ("  (" .. item.wins .. " Fenster)") or ""
				local text = nr .. " " .. mark .. " " .. item.label .. extra
				return { value = item, display = text, ordinal = text }
			end,
		})
	end

	local function close_tab(prompt_bufnr)
		local item = state.get_selected_entry().value
		if #vim.api.nvim_list_tabpages() == 1 then
			vim.notify("Letzter Tab kann nicht geschlossen werden")
			return
		end
		if item.tab == origin then
			actions.close(prompt_bufnr)
			vim.cmd.tabclose()
			return
		end
		vim.cmd.tabclose(vim.api.nvim_tabpage_get_number(item.tab))
		state.get_current_picker(prompt_bufnr):refresh(make_finder(), { reset_prompt = false })
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Tabs",
			finder = make_finder(),
			sorter = require("telescope.config").values.generic_sorter({}),
			default_selection_index = vim.api.nvim_tabpage_get_number(origin),
			previewer = require("telescope.previewers").new_buffer_previewer({
				title = "Aktiver Puffer",
				define_preview = function(self, entry)
					local buf = entry.value.buf
					local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
					vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)
					local ft = vim.bo[buf].filetype
					if ft ~= "" then
						require("telescope.previewers.utils").highlighter(self.state.bufnr, ft)
					end
				end,
			}),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					local item = state.get_selected_entry().value
					actions.close(prompt_bufnr)
					if vim.api.nvim_tabpage_is_valid(item.tab) then
						vim.api.nvim_set_current_tabpage(item.tab)
					end
				end)
				map("i", "<C-d>", close_tab)
				map("n", "d", close_tab)
				return true
			end,
		})
		:find()
end

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
			"jvgrootveld/telescope-zoxide",
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
				{ search_prefix .. "t", tab_picker, desc = "Tabs durchsuchen" },
				{ search_prefix .. "T", builtin.colorscheme, desc = "Farbschema wählen" },
				{
					search_prefix .. "z",
					function()
						require("telescope").extensions.zoxide.list()
					end,
					desc = "Verzeichnisse suchen (zoxide)",
				},
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

			local mappings = {
				i = {
					["<C-j>"] = action.move_selection_next,
					["<C-k>"] = action.move_selection_previous,
					["<C-f>"] = action.preview_scrolling_left,
					["<C-b>"] = action.preview_scrolling_right,
					["<C-s>"] = flash,
				},
				n = {
					s = flash,
				},
			}
			-- <C-1>…<C-9> öffnen den n-ten Treffer
			for n = 1, 9 do
				mappings.i["<C-" .. n .. ">"] = select_nth(n)
				mappings.n["<C-" .. n .. ">"] = select_nth(n)
			end

			require("telescope").setup({
				defaults = {
					mappings = mappings,
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
			require("telescope").load_extension("zoxide")
		end,
	},
}
