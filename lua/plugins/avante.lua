local openai_api_key = os.getenv "YADRO_API_KEY" -- взять из выданного конфига
local openai_base_endpoint = "https://litellm-proxy.ai.yadro.com"

return {
  {
    "ravitemer/mcphub.nvim",
    cond = not (openai_api_key == nil),
  },
  {
    "yetone/avante.nvim",
    cond = not (openai_api_key == nil),
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
      provider = "qwen2.5-coder:32b",
      behaviour = {
        auto_suggestions = false,
        auto_approve_tool_permissions = true,
      },
      providers = {
        ["qwen2.5-coder:32b"] = {
          model = "chat/qwen2.5-coder:32b",
          __inherited_from = "openai",
          endpoint = "https://litellm-proxy.ai.yadro.com",
          api_key_name = "YADRO_API_KEY",
          disable_tools = true,
          context_window = 131072,
        },
        ["deepseek-r1"] = {
          __inherited_from = "openai",
          endpoint = "https://litellm-proxy.ai.yadro.com",
          api_key_name = "YADRO_API_KEY",
          disable_tools = true,
          context_window = 32768,
          model = "beta/chat/deepseek-r1:70b-llama-distill-fp16",
        },
        ["qwen2.5-coder:7b"] = {
          disable_tools = true, -- disable tools!
          model = "autocomplete/qwen2.5-coder:7b",
          endpoint = "https://litellm-proxy.ai.yadro.com",
          api_key_name = "YADRO_API_KEY",
          __inherited_from = "openai",
          context_window = 20000,
          timeout = 1,
          extra_request_body = {
            max_tokens = 100,
          },
          ["nomic-embed-text"] = {
            __inherited_from = "openai",
            model = "embed/nomic-embed-text",
          },
        },
      },
    },
  },
  {
    "milanglacier/minuet-ai.nvim",
    cond = not (openai_api_key == nil),
    config = function()
      require("minuet").setup {
        n_completions = 3,
        context_window = 32768,
        request_timeout = 2,
        provider = "openai_fim_compatible",
        provider_options = {
          openai_compatible = {
            api_key = function() return openai_api_key end,
            end_point = openai_base_endpoint .. "/v1/chat/completions",
            model = "autocomplete/qwen2.5-coder:7b",
            stream = true,
            optional = {
              max_tokens = 150,
              top_p = 0.9,
            },
          },
          openai_fim_compatible = {
            api_key = function() return openai_api_key end,
            end_point = openai_base_endpoint .. "/completions",
            model = "autocomplete/qwen2.5-coder:7b",
            stream = true,
            template = {
              prompt = function(context_before_cursor, context_after_cursor, _)
                return "<|fim_prefix|>"
                  .. context_before_cursor
                  .. "<|fim_suffix|>"
                  .. context_after_cursor
                  .. "<|fim_middle|>"
              end,
              suffix = false,
            },
            optional = {
              max_tokens = 150,
              top_p = 0.9,
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
