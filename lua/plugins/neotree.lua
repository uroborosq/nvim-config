return {
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- Uncomment whichever supported plugin(s) you use
			-- "nvim-tree/nvim-tree.lua",
			"nvim-neo-tree/neo-tree.nvim",
			-- "simonmclean/triptych.nvim"
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			{ "folke/which-key.nvim" },
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
		},
		config = function(_, opts)
			require("which-key").add({
				{ "<Leader>e", ":Neotree filesystem float reveal toggle<CR>" },
				{ "<Leader>o", ":Neotree filesystem float reveal toggle<CR>" },
				{ "<Leader>E", ":Neotree filesystem left reveal toggle<CR>" },
			})

			require("neo-tree").setup(opts)
		end,
		opts = {
			filesystem = {
				filtered_items = {
					visible = true,
					show_hidden_count = true,
					hide_dotfiles = false,
					hide_gitignored = false,
					never_show = { ".git", ".vscode", ".idea" },
				},
			},
		},
	},
}
