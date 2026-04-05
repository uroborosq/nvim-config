local openai_api_key = os.getenv("YADRO_API_KEY") -- взять из выданного конфига

return {
	{
		"ravitemer/mcphub.nvim",
		cond = not (openai_api_key == nil),
	},
	{
		"yetone/avante.nvim",
		version = false,
		build = vim.fn.has("win32") ~= 0
				and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
			or "make",
		cond = not (openai_api_key == nil),
		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"nvim-neo-tree/neo-tree.nvim",
				opts = {
					filesystem = {
						commands = {
							avante_add_files = function(state)
								local node = state.tree:get_node()
								local filepath = node:get_id()
								local relative_path = require("avante.utils").relative_path(filepath)
								local sidebar = require("avante").get()
								local open = sidebar:is_open()
								if not open then
									require("avante.api").ask()
									sidebar = require("avante").get()
								end
								sidebar.file_selector:add_selected_file(relative_path)
								if not open then
									sidebar.file_selector:remove_selected_file("neo-tree filesystem [1]")
								end
							end,
						},
						window = {
							mappings = {
								["oa"] = "avante_add_files",
							},
						},
					},
				},
			},
		},
		opts = {
			system_prompt = function()
				local hub = require("mcphub").get_hub_instance()
				return hub and hub:get_active_servers_prompt() or ""
			end,
			-- Using function prevents requiring mcphub before it's loaded
			custom_tools = function()
				return {
					require("mcphub.extensions.avante").mcp_tool(),
				}
			end,
			provider = "kilocode",
			behaviour = {
				auto_suggestions = false,
			},
			input = {
				provider = "snacks", -- "native" | "dressing" | "snacks"
				provider_opts = {
					-- Snacks input configuration
					title = "Avante Input",
					icon = " ",
					placeholder = "Enter your API key...",
				},
			},
			acp_providers = {
				["kilocode"] = {
					command = "kilo",
					args = { "acp" },
					env = {
						NODE_NO_WARNINGS = "1",
					},
				},
			},
			providers = {
				---@type AvanteSupportedProvider
				["kilocode"] = {
					model = "glm-4.7",
					__inherited_from = "openai",
					context_window = 131072,
					extra_request_body = {
						max_tokens = 32768,
					},
				},
				["GLM"] = {
					model = "GLM-4.7-FP8",
					__inherited_from = "openai",
					endpoint = "https://litellm-proxy.ai.yadro.com",
					api_key_name = "YADRO_API_KEY",
					context_window = 131072,
					extra_request_body = {
						max_tokens = 32768,
					},
				},
				["qwen3-coder"] = {
					model = "Qwen3-Coder-30B-A3B-Instruct-FP8",
					__inherited_from = "openai",
					endpoint = "https://litellm-proxy.ai.yadro.com",
					api_key_name = "YADRO_API_KEY",
					context_window = 262144,
					extra_request_body = {
						max_tokens = 65336,
					},
				},
			},
		},
	},
	{
		"milanglacier/minuet-ai.nvim",
		cond = not (openai_api_key == nil),
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
