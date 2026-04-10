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
			{ "s1n7ax/nvim-window-picker", version = "*" },
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
			commands = {
				parent_or_close = function(state)
					local node = state.tree:get_node()
					if node:has_children() and node:is_expanded() then
						state.commands.toggle_node(state)
					else
						require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
					end
				end,
				child_or_open = function(state)
					local node = state.tree:get_node()
					if node:has_children() then
						if not node:is_expanded() then -- if unexpanded, expand
							state.commands.toggle_node(state)
						else -- if expanded and has children, seleect the next child
							if node.type == "file" then
								state.commands.open(state)
							else
								require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
							end
						end
					else -- if has no children
						state.commands.open(state)
					end
				end,
			},
			window = {
				mappings = {
					h = "parent_or_close",
					l = "child_or_open",
				},
			},
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
