return {
	"retran/meow.yarn.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function()
		-- Using lua functions
		vim.keymap.set("n", "<leader>yt", function()
			require("meow.yarn").open_tree("type_hierarchy", "supertypes")
		end, { desc = "Yarn: Type Hierarchy (Super)" })
		vim.keymap.set("n", "<leader>yT", function()
			require("meow.yarn").open_tree("type_hierarchy", "subtypes")
		end, { desc = "Yarn: Type Hierarchy (Sub)" })
		vim.keymap.set("n", "<leader>yc", function()
			require("meow.yarn").open_tree("call_hierarchy", "callers")
		end, { desc = "Yarn: Call Hierarchy (Callers)" })
		vim.keymap.set("n", "<leader>yC", function()
			require("meow.yarn").open_tree("call_hierarchy", "callees")
		end, { desc = "Yarn: Call Hierarchy (Callees)" })
		vim.keymap.set("n", "<leader>yl", "<Plug>(MeowYarnLast)", { desc = "Yarn: Re-open last hierarchy" })

		-- Or using commands
		vim.keymap.set("n", "<leader>yS", "<Cmd>MeowYarn type super<CR>", { desc = "Yarn: Super Types" })
		vim.keymap.set("n", "<leader>ys", "<Cmd>MeowYarn type sub<CR>", { desc = "Yarn: Sub Types" })
		vim.keymap.set("n", "<leader>yC", "<Cmd>MeowYarn call callers<CR>", { desc = "Yarn: Callers" })
		vim.keymap.set("n", "<leader>yc", "<Cmd>MeowYarn call callees<CR>", { desc = "Yarn: Callees" })
		-- default
		require("meow.yarn").setup({
			window = {
				width = 0.8,
				height = 0.85,
				border = "rounded",
				preview_height_ratio = 0.35,
				-- "vertical": tree above, preview below (default); "horizontal": tree left, preview right
				layout = "vertical",
			},
			icons = {
				loading = "",
				placeholder = "",
				selected = "●",
				animation_frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
			},
			mappings = {
				jump = "<CR>",
				toggle = "<Tab>",
				expand = "l",
				expand_alt = "<Right>",
				collapse = "h",
				collapse_alt = "<Left>",
				show_super_hierarchy = "K",
				show_sub_hierarchy = "J",
				quit = "q",
				breadcrumb_back = "<BS>",
				yank_path = "y",
				expand_all = "zO",
				collapse_all = "zC",
				filter = "/",
				preview_scroll_down = "<C-d>",
				preview_scroll_up = "<C-u>",
				sort = "s",
				toggle_select = "<Space>",
				clear_selection = "<Esc>",
				send_to_quickfix = "<C-q>",
			},
			quickfix = {
				-- Open trouble.nvim (when installed) instead of the built-in quickfix window.
				use_trouble = true,
			},
			-- Stay in the hierarchy window after jumping to a symbol.
			keep_open_on_jump = false,
			expand_depth = 3,
			preview_context_lines = 10,
			animation_speed = 100,
			hierarchies = {
				type_hierarchy = {
					icons = {
						class = "󰌗",
						struct = "󰙅",
						interface = "󰌆",
						default = "",
					},
				},
				call_hierarchy = {
					icons = {
						method = "󰆧",
						func = "󰊕",
						variable = "",
						default = "",
					},
				},
			},
			-- Optional: fully control how each node is rendered, see `:help meow-yarn-render-node`.
			-- render_node = function(node_info)
			--     return string.format("%s %s", node_info.icon, node_info.name)
			-- end,
		})
	end,
}
