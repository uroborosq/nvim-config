return {
	-- {
	-- 	"folke/which-key",
	-- },
	{
		"folke/snacks.nvim",
		keys = {
			{
				"<leader>gg",
				function()
					require("snacks").lazygit.open()
				end,
				desc = "LazyGit",
			},
		},
		---@type snacks.Config
		opts = {
			lazygit = {
				win = {
					width = 0,
					height = 0,
					border = "none",
				},
				config = {
					os = {
						open = 'nvim --server "$NVIM" --remote-send "<C-L>"  && nvim --server "$NVIM" --remote-send ":e {{filename}}<CR>" && nvim --server "$NVIM" --remote-send "<C-W>wq"',
					},
				},
			},
		},
	},
}
