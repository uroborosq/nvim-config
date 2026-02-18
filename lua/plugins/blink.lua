return {
	"Saghen/blink.cmp",
	-- enabled = false,
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	dependencies = {
		{
			{ "saghen/blink.compat", version = "1.*" },
			{ "rafamadriz/friendly-snippets" }, -- optional
		},
	},
	version = "1.*",
	opts = {
		completion = {
			menu = {
				draw = {
					columns = {
						{ "kind_icon", "label", "label_description", gap = 1 },
						{ "kind", gap = 1, "source_name" },
					},
				},
			},
			list = {
				selection = {
					preselect = true,
					auto_insert = true,
				},
			},
		},
		fuzzy = {
			sorts = { "sort_text" },
			implementation = "rust",
		},

		keymap = {
			preset = "none",

			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },

			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-p>"] = { "snippet_backward", "fallback_to_mappings" },
			["<C-n>"] = { "snippet_forward", "fallback_to_mappings" },

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },

			["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
			["<C-Space>"] = {
				function(cmp)
					cmp.show({ providers = { "snippets" } })
				end,
			},
		},
		signature = { enabled = true },
		sources = {
			default = { "lazydev", "lsp", "path" },
			providers = {
				snippets = {
					enabled = true,
				},
				path = {
					enabled = true,
				},
				buffer = {
					enabled = true,
				},
			},
		},
	},
}
