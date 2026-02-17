return {
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
				-- your lazygit configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			},
		},
	},
	-- "kdheepak/lazygit.nvim",
	-- lazy = true,
	-- cmd = {
	--     "LazyGit",
	--     "LazyGitConfig",
	--     "LazyGitCurrentFile",
	--     "LazyGitFilter",
	--     "LazyGitFilterCurrentFile",
	-- },
	-- dependencies = {
	--     "nvim-lua/plenary.nvim",
	-- },
	-- keys = {
	--     { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
	-- }
}
