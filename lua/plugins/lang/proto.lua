vim.lsp.config("protols", {
	settings = {
		init_options = {
			include_paths = {
				"/usr/include",
			},
		},
	},
})

return {
	{
		"nvim-treesitter/nvim-treesitter",
		optional = true,
		opts = function(_, opts)
			if opts.ensure_installed ~= "all" then
				opts.ensure_installed = opts.ensure_installed or {}

				if not vim.tbl_contains(opts.ensure_installed, "proto") then
					table.insert(opts.ensure_installed, "proto")
				end
			end
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		optional = true,
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}

			if not vim.tbl_contains(opts.ensure_installed, "protols") then
				table.insert(opts.ensure_installed, "protols")
			end
		end,
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		optional = true,
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}

			for _, tool in ipairs({ "buf", "protols" }) do
				if not vim.tbl_contains(opts.ensure_installed, tool) then
					table.insert(opts.ensure_installed, tool)
				end
			end
		end,
	},

	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				proto = { "buf" },
			},
		},
	},

	{
		"mfussenegger/nvim-lint",
		optional = true,
		opts = {
			linters_by_ft = {
				proto = { "buf_lint" },
			},
		},
	},
}
