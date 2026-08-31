local prefix = "<leader>g"

return {
	{
		"polarmutex/git-worktree.nvim",
		version = "^2",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"folke/which-key.nvim",
			"nvim-telescope/telescope.nvim",
		},
		init = function()
			-- Standard ist "e .": das öffnet einen Verzeichnis-Buffer, den neo-tree übernimmt
			vim.g.git_worktree = {
				update_on_change_command = "enew",
			}
		end,
		config = function()
			local hooks = require("git-worktree.hooks")
			local config = require("git-worktree.config")

			hooks.register(hooks.type.SWITCH, function(path, prev_path)
				vim.notify("Worktree: " .. prev_path .. " -> " .. path)
				hooks.builtins.update_current_buffer_on_switch(path, prev_path)
			end)

			hooks.register(hooks.type.DELETE, function()
				vim.cmd(config.update_on_change_command)
			end)

			require("telescope").load_extension("git_worktree")

			require("which-key").add({
				{
					prefix .. "w",
					function()
						require("telescope").extensions.git_worktree.git_worktree()
					end,
					desc = "Git worktrees (<M-c> erstellen, <M-d> löschen)",
				},
				{
					prefix .. "W",
					function()
						require("telescope").extensions.git_worktree.create_git_worktree()
					end,
					desc = "Git worktree erstellen",
				},
			})
		end,
	},
}
