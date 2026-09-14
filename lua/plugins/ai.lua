local openai_api_key = os.getenv("YADRO_API_KEY") -- взять из выданного конфига

return {
	{
		"ravitemer/mcphub.nvim",
		cond = not (openai_api_key == nil),
	},
	{
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
		opts = {
			terminal = {
				split_side = "left",
			},
		},
		-- `cmd` lets lazy.nvim create command stubs that load the plugin on first use,
		-- so `:ClaudeCode` and friends work on a fresh start. Without it, a keys-only
		-- spec defers loading until a <leader>a* mapping is pressed and the commands
		-- would not exist yet.
		cmd = {
			"ClaudeCode",
			"ClaudeCodeFocus",
			"ClaudeCodeSelectModel",
			"ClaudeCodeAdd",
			"ClaudeCodeSend",
			"ClaudeCodeTreeAdd",
			"ClaudeCodeStatus",
			"ClaudeCodeStart",
			"ClaudeCodeStop",
			"ClaudeCodeOpen",
			"ClaudeCodeClose",
			"ClaudeCodeDiffAccept",
			"ClaudeCodeDiffDeny",
			"ClaudeCodeCloseAllDiffs",
		},
		keys = {
			{ "<leader>a", nil, desc = "AI/Claude Code" },
			{ "<leader>aa", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
			{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
			{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
			{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
			{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
			{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
			{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
			{
				"<leader>as",
				"<cmd>ClaudeCodeTreeAdd<cr>",
				desc = "Add file",
				ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw", "snacks_picker_list" },
			},
			-- Diff management
			{ "<leader>aA", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
			{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
		},
	},
	{
		"milanglacier/minuet-ai.nvim",
		cond = not (openai_api_key == nil) and not (vim.fn.getenv("SKIP_PROXY") == "1"),
		config = function()
			require("minuet").setup({
				provider = "openai_fim_compatible",
				n_completions = 3,
				context_window = 512,
				debounce = 300,
				add_single_line_entry = true, -- true for one-line autocomplete
				provider_options = {
					openai_fim_compatible = {
						api_key = "YADRO_API_KEY",
						end_point = "https://litellm-proxy.ai.yadro.com/completions",
						model = "Qwen2.5-Coder-7B-Instruct-fp8",
						name = "yadro_autocomplete",
						optional = {
							max_tokens = 30,
						},
						template = {
							prompt = function(context_before_cursor, context_after_cursor, opts)
								return "<|fim_prefix|>"
									.. context_before_cursor
									.. "<|fim_suffix|>"
									.. context_after_cursor
									.. "<|fim_middle|>"
							end,
							suffix = false,
						},
					},
				},
				virtualtext = {
					auto_trigger_ft = { "go", "proto", "json", "yaml" },
					keymap = {
						accept = "<A-a>",
						accept_line = "<A-o>",
						accept_n_lines = "<A-z>",
						prev = "<A-k>",
						next = "<A-j>",
						dismiss = "<A-c>",
					},
				},
			})
		end,
	},
}
