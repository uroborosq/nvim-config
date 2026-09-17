local has_gleam = vim.fn.executable("gleam") == 1

-- Не используем `cond` в спецификациях общих плагинов: lazy.nvim сливает все
-- фрагменты одного плагина, и `cond = false` отключает плагин целиком
-- (nvim-lspconfig, nvim-treesitter), а не только эти настройки.
return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if has_gleam then
				opts.ensure_installed = opts.ensure_installed or {}
				opts.ensure_installed.gleam = "gleam"
			end
		end,
	},
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				gleam = { "gleam" },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = function(_, _)
			if has_gleam then
				vim.lsp.enable("gleam")
			end
		end,
	},
}
