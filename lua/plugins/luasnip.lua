return {
	"L3MON4D3/LuaSnip",
	dependencies = {
		{ "rafamadriz/friendly-snippets" }, -- optional
		{ "folke/which-key.nvim" },
	},
	-- enabled = false,
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	config = function(_, opts)
		local ls = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()
		require("which-key").add({
			{
				"<C-L>",
				function()
					ls.expand()
				end,
				mode = "i",
			},
			{
				"<C-N>",
				function()
					ls.jump(1)
				end,
				mode = "i",
			},
			{
				"<C-J>",
				function()
					ls.jump(-1)
				end,
				mode = "i",
			},
		})

		require("luasnip").setup(opts)
	end,
}
