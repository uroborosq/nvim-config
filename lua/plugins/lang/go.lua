vim.lsp.config("gopls", {
	settings = {
		gopls = {
			analyses = {
				ST1000 = false,
				ST1021 = false,
				ST1003 = true,
				fieldalignment = false,
				fillreturns = true,
				nilness = true,
				nonewvars = true,
				shadow = false,
				undeclaredname = true,
				unreachable = true,
				unusedparams = true,
				unusedwrite = true,
				useany = true,
				simplifyrange = true,
			},
			codelenses = {
				generate = true, -- show the `go generate` lens.
				regenerate_cgo = true,
				test = true,
				tidy = true,
				upgrade_dependency = true,
				vendor = false,
			},
			hints = {
				ignoredError = true,
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
			experimentalPostfixCompletions = true,
			buildFlags = { "-tags", "integration" },
			symbolMatcher = "Fuzzy",
			completeUnimported = true,
			diagnosticsDelay = "500ms",
			staticcheck = true,
			usePlaceholders = true,
			vulncheck = "Imports",
			semanticTokens = true,
		},
	},
})
return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			if opts.ensure_installed ~= "all" then
				opts.ensure_installed =
					vim.list_extend(opts.ensure_installed, { "go", "gomod", "gosum", "gowork", "asm" })
			end
		end,
	},

	{
		"jay-babu/mason-null-ls.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			opts.ensure_installed = vim.list_extend(opts.ensure_installed, {
				"gomodifytags",
				"gofumpt",
				"iferr",
				"impl",
				"goimports",
				"golangci-lint",
				"goimports-reviser",
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			opts.ensure_installed = vim.list_extend(opts.ensure_installed, {
				"gopls",
				"gomodifytags",
				"gofumpt",
				"iferr",
				"impl",
				"goimports",
				"golangci-lint",
				"goimports-reviser",
			})
		end,
	},
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("dap-go").setup({})
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			opts.ensure_installed = vim.list_extend(opts.ensure_installed, { "delve" })
		end,
	},
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		build = function()
			if not require("lazy.core.config").spec.plugins["mason.nvim"] then
				vim.print("Installing go dependencies...")
				vim.cmd.GoInstallDeps()
			end
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			{ "williamboman/mason.nvim" }, -- by default use Mason for go dependencies
		},
		opts = {},
	},
	{
		"mfussenegger/nvim-lint",
		lazy = false,
		opts = function(_, opts)
			opts = opts or {}

			local lint = require("lint")
			local result = vim.deepcopy(lint.linters.golangcilint)

			lint.linters.golangcilint.parser = function(output, bufnr, cwd)
				local diagnostics = result.parser(output, bufnr, cwd)
				local filtered = {}
				for _, d in ipairs(diagnostics) do
					if not (d.source == "typecheck") then
						table.insert(filtered, d)
					end
				end

				return filtered
			end

			opts.linters_by_ft = opts.linters_by_ft or {}
			opts.linters_by_ft.go = { "golangcilint" }

			return opts
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				go = { "goimports-reviser", stop_after_first = false },
			},
		},
	},
}
