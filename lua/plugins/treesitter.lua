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
		build = ":TSUpdate",
		---@class TSConfig
		opts = {
			ensure_installed = {},
		},
		config = function(_, opts)
			register(opts.ensure_installed)
			install_and_start()
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
}
