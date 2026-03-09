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
			{
				"<leader>gC",
				function()
					require("snacks").lazygit.log()
				end,
				desc = "Git log",
			},
			{
				"<leader>gc",
				function()
					require("snacks").lazygit.log_file()
				end,
				desc = "Git commits in current file",
			},
		},
		---@type snacks.Config
		opts = {
			lazygit = {
				config = {
					os = {
						open = 'nvim --server "$NVIM" --remote-send "<C-L>"  && nvim --server "$NVIM" --remote-send ":e {{filename}}<CR>" && nvim --server "$NVIM" --remote-send "<C-W>wq"',
					},
				},
			},
		},
	},
}
