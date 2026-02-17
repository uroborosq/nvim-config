return {
	"Wansmer/treesj",
	cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
	keys = {
		{ "<Leader>lt", ":TSJToggle<CR>", desc = "Toggle" },
	},
	opts = {
		use_default_keymaps = false,
		check_syntax_error = false,
		max_join_length = 120000,
	},
}
