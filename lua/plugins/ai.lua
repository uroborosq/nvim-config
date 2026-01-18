local openai_api_key = os.getenv "YADRO_API_KEY" -- взять из выданного конфига
local openai_base_endpoint = "https://litellm-proxy.ai.yadro.com"

return {
  -- {
  --   "ravitemer/mcphub.nvim",
  --   cond = not (openai_api_key == nil),
  -- },
  -- {
  --   "yetone/avante.nvim",
  --   cond = not (openai_api_key == nil),
  --   opts = {
  --     system_prompt = function()
  --       local hub = require("mcphub").get_hub_instance()
  --       return hub and hub:get_active_servers_prompt() or ""
  --     end,
  --     -- Using function prevents requiring mcphub before it's loaded
  --     custom_tools = function()
  --       return {
  --         require("mcphub.extensions.avante").mcp_tool(),
  --       }
  --     end,
  --     provider = "qwen3-coder",
  --     behaviour = {
  --       auto_suggestions = false,
  --     },
  --     providers = {
  --       ["qwen3-coder"] = {
  --         model = "Qwen3-Coder-30B-A3B-Instruct-FP8",
  --         __inherited_from = "openai",
  --         endpoint = "https://litellm-proxy.ai.yadro.com",
  --         api_key_name = "YADRO_API_KEY",
  --         context_window = 262144,
  --         extra_request_body = {
  --           max_tokens = 65336,
  --         },
  --       },
  --       ["deepseek-r1"] = {
  --         __inherited_from = "openai",
  --         endpoint = "https://litellm-proxy.ai.yadro.com",
  --         api_key_name = "YADRO_API_KEY",
  --         context_window = 32768,
  --         model = "beta/chat/deepseek-r1:70b-llama-distill-fp16",
  --       },
  --       ["qwen2.5-coder:7b"] = {
  --         model = "autocomplete/qwen2.5-coder:7b",
  --         endpoint = "https://litellm-proxy.ai.yadro.com",
  --         api_key_name = "YADRO_API_KEY",
  --         __inherited_from = "openai",
  --         context_window = 20000,
  --         timeout = 1,
  --         extra_request_body = {
  --           max_tokens = 100,
  --         },
  --         ["nomic-embed-text"] = {
  --           __inherited_from = "openai",
  --           model = "embed/nomic-embed-text",
  --         },
  --       },
  --     },
  --   },
  -- },
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("minuet").setup {
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
      }
    end,
  },
}
