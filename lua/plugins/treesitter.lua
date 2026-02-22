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

			local parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)
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
			ensure_installed = {},
		},
		config = function(_, opts)
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

			xo("ak", "@block.outer", "around block")
			xo("ik", "@block.inner", "inside block")
			xo("ac", "@class.outer", "around class")
			xo("ic", "@class.inner", "inside class")
			xo("a?", "@conditional.outer", "around conditional")
			xo("i?", "@conditional.inner", "inside conditional")
			xo("af", "@function.outer", "around function")
			xo("if", "@function.inner", "inside function")
			xo("ao", "@loop.outer", "around loop")
			xo("io", "@loop.inner", "inside loop")
			xo("aa", "@parameter.outer", "around argument")
			xo("ia", "@parameter.inner", "inside argument")

			-- Move textobjects (n/x/o)
			local function nxo(lhs, fn, query, desc)
				vim.keymap.set({ "n", "x", "o" }, lhs, function()
					fn(query, "textobjects")
				end, { desc = desc })
			end

			nxo("]k", ts_move.goto_next_start, "@block.outer", "Next block start")
			nxo("]f", ts_move.goto_next_start, "@function.outer", "Next function start")
			nxo("]a", ts_move.goto_next_start, "@parameter.inner", "Next argument start")

			nxo("]K", ts_move.goto_next_end, "@block.outer", "Next block end")
			nxo("]F", ts_move.goto_next_end, "@function.outer", "Next function end")
			nxo("]A", ts_move.goto_next_end, "@parameter.inner", "Next argument end")

			nxo("[k", ts_move.goto_previous_start, "@block.outer", "Previous block start")
			nxo("[f", ts_move.goto_previous_start, "@function.outer", "Previous function start")
			nxo("[a", ts_move.goto_previous_start, "@parameter.inner", "Previous argument start")

			nxo("[K", ts_move.goto_previous_end, "@block.outer", "Previous block end")
			nxo("[F", ts_move.goto_previous_end, "@function.outer", "Previous function end")
			nxo("[A", ts_move.goto_previous_end, "@parameter.inner", "Previous argument end")

			-- Swap textobjects (n)
			local function nswap(lhs, fn, query, desc)
				vim.keymap.set("n", lhs, function()
					fn(query)
				end, { desc = desc })
			end

			nswap(">K", ts_swap.swap_next, "@block.outer", "Swap next block")
			nswap(">F", ts_swap.swap_next, "@function.outer", "Swap next function")
			nswap(">A", ts_swap.swap_next, "@parameter.inner", "Swap next argument")

			nswap("<K", ts_swap.swap_previous, "@block.outer", "Swap previous block")
			nswap("<F", ts_swap.swap_previous, "@function.outer", "Swap previous function")
			nswap("<A", ts_swap.swap_previous, "@parameter.inner", "Swap previous argument")
		end,
	},
}
