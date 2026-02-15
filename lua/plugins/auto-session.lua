local prefix = "<leader>S"
return {
	{
		"rmagatti/auto-session",
		lazy = false,
		keys = {
			{ prefix .. ".", ":AutoSession restore<cr>" },
		},
		---enables autocomplete for opts
		---@module "auto-session"
		---@type AutoSession.Config
		opts = {
			auto_restore = false,
			suppressed_dirs = { "~/", "/" },
		},
	},
}
