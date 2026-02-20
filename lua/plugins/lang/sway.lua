vim.filetype.add({
	pattern = {
		[".*config/sway/.*"] = "swayconfig",
	},
})
return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				swayconfig = "swayconfig",
			},
		},
	},
}
