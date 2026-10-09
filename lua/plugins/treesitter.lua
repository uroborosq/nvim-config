local branch = "main"

--- Register parsers from opts.ensure_installed
local function register(ensure_installed)
	for filetype, parser in pairs(ensure_installed) do
		local filetypes = vim.treesitter.language.get_filetypes(parser)
		if not vim.tbl_contains(filetypes, filetype) then
			table.insert(filetypes, filetype)
		end

		vim.treesitter.language.register(parser, filetypes)
	end
end

local function configure_folds(winid)
	local win = winid or 0
	if vim.w[win].treesitter_folds_configured then
		return
	end

	vim.wo[win].foldexpr = "v:lua.vim.treesitter.foldexpr()"
	vim.wo[win].foldmethod = "expr"
	vim.opt.foldlevel = 99
	vim.opt.foldlevelstart = 99
	vim.opt.foldenable = true
	vim.w[win].treesitter_folds_configured = true
end

--- Install and start parsers for nvim-treesitter.
local function install_and_start()
	local parser_configs = require("nvim-treesitter.parsers")

	vim.api.nvim_create_autocmd({ "FileType" }, {
		callback = function(event)
			local bufnr = event.buf
			if vim.b[bufnr].treesitter_started then
				return
			end

			local filetype = vim.bo[bufnr].filetype
			if filetype == "" then
				return
			end

			local parser_name = vim.treesitter.language.get_lang(filetype)
			if not parser_name or not parser_configs[parser_name] then
				return
			end

			local parser_installed = vim.treesitter.get_parser(bufnr, parser_name)
			if not parser_installed then
				require("nvim-treesitter").install({ parser_name })
				return
			end

			vim.treesitter.start(bufnr, parser_name)
			vim.b[bufnr].treesitter_started = true
			configure_folds(0)
		end,
	})

	vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
		callback = function()
			if vim.b.treesitter_started then
				configure_folds(0)
			end
		end,
	})
end

return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = branch,
		main = "nvim-treesitter.config", -- Sets main module to use for opts
		build = ":TSUpdate",
		---@class TSConfig
		opts = {
			ensure_installed = { "regex" },
			auto_install = true,
		},
		config = function(_, opts)
			-- custom parsers are added in User TSUpdate autocmds
			vim.api.nvim_exec_autocmds("User", { pattern = "TSUpdate" })
			register(opts.ensure_installed)
			install_and_start()

			-- vim.notify(vim.inspect(opts))
			require("nvim-treesitter").setup(opts)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufRead",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			event = "BufRead",
		},
		opts = {
			multiwindow = true,
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		init = function()
			-- Optional, but recommended by the plugin README to avoid ftplugin map conflicts
			vim.g.no_plugin_maps = true
		end,
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					lookahead = true,
				},
				move = {
					set_jumps = true,
				},
				-- swap has no required setup options; keymaps are defined below
			})

			local ts_select = require("nvim-treesitter-textobjects.select")
			local ts_move = require("nvim-treesitter-textobjects.move")
			local ts_swap = require("nvim-treesitter-textobjects.swap")

			-- Select textobjects (x/o)
			local function xo(lhs, query, desc)
				vim.keymap.set({ "x", "o" }, lhs, function()
					ts_select.select_textobject(query, "textobjects")
				end, { desc = desc })
			end

			xo("ak", "@block.outer", "Block (außen)")
			xo("ik", "@block.inner", "Block (innen)")
			xo("ac", "@class.outer", "Klasse (außen)")
			xo("ic", "@class.inner", "Klasse (innen)")
			xo("a?", "@conditional.outer", "Bedingung (außen)")
			xo("i?", "@conditional.inner", "Bedingung (innen)")
			xo("af", "@function.outer", "Funktion (außen)")
			xo("if", "@function.inner", "Funktion (innen)")
			xo("ao", "@loop.outer", "Schleife (außen)")
			xo("io", "@loop.inner", "Schleife (innen)")
			xo("aa", "@parameter.outer", "Argument (außen)")
			xo("ia", "@parameter.inner", "Argument (innen)")

			-- Move textobjects (n/x/o)
			local function nxo(lhs, fn, query, desc)
				vim.keymap.set({ "n", "x", "o" }, lhs, function()
					fn(query, "textobjects")
				end, { desc = desc })
			end

			nxo("]k", ts_move.goto_next_start, "@block.outer", "Nächster Blockanfang")
			nxo("]f", ts_move.goto_next_start, "@function.outer", "Nächster Funktionsanfang")
			nxo("]a", ts_move.goto_next_start, "@parameter.inner", "Nächster Argumentanfang")

			nxo("]K", ts_move.goto_next_end, "@block.outer", "Nächstes Blockende")
			nxo("]F", ts_move.goto_next_end, "@function.outer", "Nächstes Funktionsende")
			nxo("]A", ts_move.goto_next_end, "@parameter.inner", "Nächstes Argumentende")

			nxo("[k", ts_move.goto_previous_start, "@block.outer", "Vorheriger Blockanfang")
			nxo("[f", ts_move.goto_previous_start, "@function.outer", "Vorheriger Funktionsanfang")
			nxo("[a", ts_move.goto_previous_start, "@parameter.inner", "Vorheriger Argumentanfang")

			nxo("[K", ts_move.goto_previous_end, "@block.outer", "Vorheriges Blockende")
			nxo("[F", ts_move.goto_previous_end, "@function.outer", "Vorheriges Funktionsende")
			nxo("[A", ts_move.goto_previous_end, "@parameter.inner", "Vorheriges Argumentende")

			-- Swap textobjects (n)
			local function nswap(lhs, fn, query, desc)
				vim.keymap.set("n", lhs, function()
					fn(query)
				end, { desc = desc })
			end

			nswap(">K", ts_swap.swap_next, "@block.outer", "Block mit nächstem tauschen")
			nswap(">F", ts_swap.swap_next, "@function.outer", "Funktion mit nächster tauschen")
			nswap(">A", ts_swap.swap_next, "@parameter.inner", "Argument mit nächstem tauschen")

			nswap("<K", ts_swap.swap_previous, "@block.outer", "Block mit vorherigem tauschen")
			nswap("<F", ts_swap.swap_previous, "@function.outer", "Funktion mit vorheriger tauschen")
			nswap("<A", ts_swap.swap_previous, "@parameter.inner", "Argument mit vorherigem tauschen")
		end,
	},
}
