return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			opts.ensure_installed =
				vim.list_extend(opts.ensure_installed, { "basedpyright", "black", "isort", "debugpy" })
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		optional = true,
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			opts.ensure_installed = vim.list_extend(opts.ensure_installed, { "black", "isort" })
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				python = "python",
				py = "python",
				toml = "toml",
			},
		},
	},
	{
		"mfussenegger/nvim-dap",
		optional = true,
		specs = {
			{
				"mfussenegger/nvim-dap-python",
				dependencies = "mfussenegger/nvim-dap",
				ft = "python", -- NOTE: ft: lazy-load on filetype
				config = function(_, opts)
					local path = vim.fn.exepath("debugpy-adapter")
					if path == "" then
						path = vim.fn.exepath("python")
					end
					require("dap-python").setup(path, opts)
				end,
			},
		},
	},
	{
		"linux-cultist/venv-selector.nvim",
		enabled = vim.fn.executable("fd") == 1 or vim.fn.executable("fdfind") == 1 or vim.fn.executable("fd-find") == 1,
		keys = {
			{ "<Leader>lv", "<Cmd>VenvSelect<CR>", desc = "Select VirtualEnv" },
		},
		opts = {},
		cmd = "VenvSelect",
	},
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				python = { "isort", "black" },
			},
		},
	},
}
