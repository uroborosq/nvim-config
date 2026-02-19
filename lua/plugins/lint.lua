local lint -- cache for the nvim-lint package
---@type LazySpec
return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "williamboman/mason.nvim" },
	specs = {
		{ "jay-babu/mason-null-ls.nvim", optional = true, opts = { methods = { diagnostics = false } } },
	},
	opts = {},
	config = function(_, opts)
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})

		lint = require("lint")
		lint.linters_by_ft = opts.linters_by_ft or {}
		lint.try_lint()
	end,
}
