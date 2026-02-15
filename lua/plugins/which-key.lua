local ignoring_code_actions = {
	["source.doc"] = true,
	["source.assembly"] = true,
	["source.test"] = true,
	["gopls.doc.features"] = true,
	["source.addTest"] = true,
	["source.toggleCompilerOptDetails"] = true,
	["source.splitPackage"] = true,
}

--- @argument action lsp.CodeAction|lsp.Command
--- @return boolean
local function is_gopls(action)
	if not (action.command == nil) then
		if not (action.command.command == nil) then
			if not (action.command.command:find("gopls") == nil) then
				return true
			end
		end
	end

	if not (action.data == nil) then
		if not (action.data.command == nil) then
			if not (action.data.command:find("gopls") == nil) then
				return true
			end
		end
	end
	return false
end

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = {
			{
				mode = { "n" },
				{ "<leader>G", group = "Golang" },
				{
					"<leader>lF",
					function()
						vim.cmd("write")
						local file = vim.fn.expand("%:p")
						local cmd = { "golangci-lint", "run", "--fix", file }

						vim.fn.jobstart(cmd, {
							stderr_buffered = true,
							on_stderr = function(_, data)
								if data and #data > 1 then
									vim.notify(table.concat(data, "\n"), vim.log.levels.WARN)
								end
							end,
							on_exit = function()
								vim.notify("golangci-lint --fix done")
							end,
						})
					end,
					desc = "golangci-lint --fix current file",
				},

				{ "<leader>Gc", "<cmd>GoCmt<CR>", desc = "Generate comment" },
				{ "<leader>Ge", "<cmd>GoIfErr<CR>", desc = "Generate if err" },
				{ "<leader>Gd", "<cmd>GoMod tidy<CR>", desc = "go mod tidy" },
				{ "<leader>Gg", "<cmd>GoGenerate %<CR>", desc = "go generate current file" },
				{ "<leader>GG", "<cmd>GoGenerate<CR>", desc = "go generate all" },

				-- без <CR>, чтобы вводить аргументы
				{ "<leader>Gi", "<cmd>GoImpl ", desc = "implement current interface" },
				{ "<leader>GI", "<cmd>GoMod init ", desc = "go mod init" },

				{ "<leader>Ga", "<cmd>GoTagAdd json<CR>", desc = "add tags to struct" },

				{ "<leader>Gt", "<cmd>GoTestAdd<CR>", desc = "gen tests for cur method" },
				{ "<leader>GT", "<cmd>GoTestsExp<CR>", desc = "gen tests for exported methods" },
			},
			{
				mode = { "i" },
				{ "<C-E>", "<esc><cmd>GoIfErr<CR>i", desc = "Generate if err" },
			},
			{
				{ "<leader>l", group = "LSP", mode = "n" },
				{
					"<leader>lc",
					function()
						require("telescope.builtin").lsp_incoming_calls()
					end,
					desc = "Incoming calls",
					mode = "n",
				},
				{
					"<leader>lC",
					function()
						require("telescope.builtin").lsp_outgoing_calls()
					end,
					desc = "Outgoing calls",
					mode = "n",
				},
				{
					"<leader>lA",
					function()
						vim.lsp.buf.code_action()
					end,
					desc = "show all code actions",
					mode = "n",
				},
				{
					"<leader>lu",
					"<cmd>LspRestart<CR>",
					desc = "Restart LSP",
					mode = "n",
				},
				-- {
				-- 	"<leader>la",
				-- 	function()
				-- 		vim.lsp.buf.code_action({
				-- 			filter = function(action)
				-- 				local gopls_detected = is_gopls(action)
				-- 				if gopls_detected and ignoring_code_actions[action.kind] then
				-- 					return false
				-- 				end
				-- 				return true
				-- 			end,
				-- 		})
				-- 	end,
				-- 	desc = "show code actions",
				-- 	mode = "n",
				-- },
			},
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
