local default_opts = { instanceName = "main" }
local function grug_far_open(opts, with_visual)
	local grug_far = require("grug-far")

	opts = opts or {}
	opts = vim.list_extend(default_opts, opts)
	if not grug_far.has_instance(opts.instanceName) then
		grug_far.open(opts)
	else
		if with_visual then
			if not opts.prefills then
				opts.prefills = {}
			end
			opts.prefills.search = grug_far.get_current_visual_selection()
		end
		grug_far.open_instance(opts.instanceName)
		if opts.prefills then
			grug_far.update_instance_prefills(opts.instanceName, opts.prefills, false)
		end
	end
end
return {
	{
		"MagicDuck/grug-far.nvim",
		-- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
		-- additional lazy config to defer loading is not really needed...
		keys = {
			-- <Leader>s (group header)
			{
				"<Leader>s",
				desc = "Search/Replace",
			},

			-- <Leader>ss
			{
				"<Leader>ss",
				function()
					grug_far_open()
				end,
				desc = "Search/Replace workspace",
				mode = "n",
			},

			-- <Leader>se
			{
				"<Leader>se",
				function()
					local ext = vim.api.nvim_buf_is_valid(0) and vim.fn.expand("%:e") or ""
					grug_far_open({
						prefills = { filesFilter = ext ~= "" and ("*." .. ext) or nil },
					})
				end,
				desc = "Search/Replace filetype",
				mode = "n",
			},

			-- <Leader>sf
			{
				"<Leader>sf",
				function()
					local filter = vim.api.nvim_buf_is_valid(0) and vim.fn.fnameescape(vim.fn.expand("%")) or nil
					grug_far_open({ prefills = { paths = filter } })
				end,
				desc = "Search/Replace file",
				mode = "n",
			},

			-- <Leader>sw
			{
				"<Leader>sw",
				function()
					local current_word = vim.fn.expand("<cword>")
					if current_word ~= "" then
						grug_far_open({
							startCursorRow = 4,
							prefills = { search = current_word },
						})
					else
						vim.notify("No word under cursor", vim.log.levels.WARN, { title = "Grug-far" })
					end
				end,
				desc = "Replace current word",
				mode = "n",
			},

			-- визуальный режим: <Leader>s
			{
				"<Leader>s",
				function()
					grug_far_open(nil, true)
				end,
				desc = "Replace selection",
				mode = "x",
			},
		},
		opts = function(_, opts)
			opts.transient = true
			if not opts.icons then
				opts.icons = {}
			end
			if vim.g.icons_enabled == false then
				opts.icons.enabled = false
				opts.resultsSeparatorLineChar = "-"
				opts.spinnerStates = { "|", "\\", "-", "/" }
			end
		end,
		config = function(_, opts)
			require("grug-far").setup(opts)
		end,
	},
	{
		"catppuccin",
		---@type CatppuccinOptions
		opts = { integrations = { grug_far = true } },
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		optional = true,
		opts = {
			commands = {
				grug_far_replace = function(state)
					local node = state.tree:get_node()
					grug_far_open({
						prefills = {
							paths = node.type == "directory" and node:get_id()
								or vim.fn.fnamemodify(node:get_id(), ":h"),
						},
					})
				end,
			},
			window = {
				mappings = {
					gS = "grug_far_replace",
				},
			},
		},
	},
}
