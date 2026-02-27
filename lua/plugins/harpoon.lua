local harpoon_prefix = "<leader>h"

return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"folke/which-key.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()
			local pickers = require("telescope.pickers")
			local finders = require("telescope.finders")
			local conf = require("telescope.config").values
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")

			local usage_file = vim.fn.stdpath("data") .. "/harpoon-branch-usage.json"
			local max_branch_files = 15

			local function load_usage()
				local fd = io.open(usage_file, "r")
				if not fd then
					return {}
				end

				local content = fd:read("*a")
				fd:close()
				if content == "" then
					return {}
				end

				local ok, decoded = pcall(vim.json.decode, content)
				if not ok or type(decoded) ~= "table" then
					return {}
				end

				return decoded
			end

			local usage = load_usage()

			local function save_usage()
				local fd = io.open(usage_file, "w")
				if not fd then
					return
				end
				fd:write(vim.json.encode(usage))
				fd:close()
			end

			local function git_root()
				local path = vim.fn.expand("%:p")
				if path == "" then
					path = vim.fn.getcwd()
				else
					path = vim.fn.fnamemodify(path, ":h")
				end

				local root = vim.fn.systemlist({ "git", "-C", path, "rev-parse", "--show-toplevel" })[1]
				if vim.v.shell_error ~= 0 or not root or root == "" then
					return nil
				end

				return root
			end

			local function git_branch(root)
				local branch = vim.fn.systemlist({ "git", "-C", root, "rev-parse", "--abbrev-ref", "HEAD" })[1]
				if vim.v.shell_error ~= 0 or not branch or branch == "" then
					return "detached"
				end
				return branch
			end

			local function branch_key()
				local root = git_root()
				if not root then
					return nil, nil, nil
				end
				local branch = git_branch(root)
				return (root .. "::" .. branch), root, branch
			end

			local function tracked_file(root)
				local abs = vim.fn.expand("%:p")
				if abs == "" or vim.fn.filereadable(abs) == 0 then
					return nil
				end
				if not root then
					return abs
				end
				if abs:sub(1, #root + 1) == (root .. "/") then
					return abs:sub(#root + 2)
				end
				return nil
			end

			local function list_for_branch()
				local key = branch_key()
				if key then
					return harpoon:list(key)
				end
				return harpoon:list()
			end

			local function ensure_top_files_in_list(limit)
				local key, root = branch_key()
				if not key or not usage[key] then
					return
				end

				local files = {}
				for file, count in pairs(usage[key]) do
					table.insert(files, { file = file, count = count })
				end

				table.sort(files, function(a, b)
					if a.count == b.count then
						return a.file < b.file
					end
					return a.count > b.count
				end)

				local list = harpoon:list(key)
				local existing = {}
				for _, item in ipairs(list.items or {}) do
					if item.value then
						existing[item.value] = true
					end
				end

				for i = 1, math.min(limit, #files) do
					local rel = files[i].file
					local full_path = root and (root .. "/" .. rel) or rel
					if not existing[full_path] and vim.fn.filereadable(full_path) == 1 then
						list:add({ value = full_path })
						existing[full_path] = true
					end
				end
			end

			local function open_telescope_for_branch()
				ensure_top_files_in_list(max_branch_files)
				local list = list_for_branch()
				local entries = {}

				for index, item in ipairs(list.items or {}) do
					if item.value and item.value ~= "" then
						table.insert(entries, {
							index = index,
							value = item.value,
						})
					end
				end

				pickers
					.new({}, {
						prompt_title = "Harpoon (current git branch)",
						finder = finders.new_table({
							results = entries,
							entry_maker = function(entry)
								return {
									value = entry,
									display = string.format("%d  %s", entry.index, entry.value),
									ordinal = entry.value,
									path = entry.value,
								}
							end,
						}),
						sorter = conf.file_sorter({}),
						previewer = conf.file_previewer({}),
						attach_mappings = function(prompt_bufnr)
							actions.select_default:replace(function()
								local selection = action_state.get_selected_entry()
								actions.close(prompt_bufnr)
								if selection and selection.value then
									vim.cmd.edit(vim.fn.fnameescape(selection.value.value))
								end
							end)
							return true
						end,
					})
					:find()
			end

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
				callback = function()
					local key, root = branch_key()
					if not key then
						return
					end
					local file = tracked_file(root)
					if not file then
						return
					end

					usage[key] = usage[key] or {}
					usage[key][file] = (usage[key][file] or 0) + 1
					save_usage()
				end,
			})

			require("which-key").add({
				{ harpoon_prefix, group = "harpoon" },
				{
					harpoon_prefix .. "a",
					function()
						list_for_branch():add()
					end,
					desc = "Harpoon add file (branch)",
				},
				{
					harpoon_prefix .. "h",
					function()
						open_telescope_for_branch()
					end,
					desc = "Harpoon telescope menu (branch)",
				},
				{
					harpoon_prefix .. "1",
					function()
						list_for_branch():select(1)
					end,
					desc = "Harpoon goto 1 (branch)",
				},
				{
					harpoon_prefix .. "2",
					function()
						list_for_branch():select(2)
					end,
					desc = "Harpoon goto 2 (branch)",
				},
				{
					harpoon_prefix .. "3",
					function()
						list_for_branch():select(3)
					end,
					desc = "Harpoon goto 3 (branch)",
				},
				{
					harpoon_prefix .. "4",
					function()
						list_for_branch():select(4)
					end,
					desc = "Harpoon goto 4 (branch)",
				},
				{
					"]m",
					function()
						list_for_branch():next()
					end,
					desc = "Harpoon next (branch)",
				},
				{
					"[m",
					function()
						list_for_branch():prev()
					end,
					desc = "Harpoon previous (branch)",
				},
			})
		end,
	},
}
