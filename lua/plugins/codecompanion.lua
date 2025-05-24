return {
  {
    "olimorris/codecompanion.nvim",
    keys = {
      { "<leader>ck", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanion actions" },
      {
        "<leader>a",
        "<cmd>CodeCompanionChat Toggle<cr>",
        mode = { "n", "v" },
        desc = "CodeCompanion Chat",
      },
    },
    opts = {
      strategies = {
        chat = {
          adapter = "groq",
        },
        inline = {
          adapter = "groq",
        },
        cmd = {
          adapter = "groq",
        },
      },
      adapters = {
        openai = function()
          return require("codecompanion.adapters").extend("openai", {
            env = {
              api_key = "cmd:rbw get 'platform.openai.com API key'",
            },
          })
        end,

        groq = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              api_key = "cmd:rbw get 'console.groq.com'",
              url = "https://api.groq.com/openai",
            },
            schema = {
              model = {
                default = "meta-llama/llama-4-scout-17b-16e-instruct"
              }
            }
          })
        end,

        openrouter = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "https://openrouter.ai/api",
              api_key = "cmd:rbw get 'openrouter.ai API key'",
              chat_url = "/v1/chat/completions",
            },
          })
        end,

        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {})
        end,

        opts = {
          show_model_choices = true,
          show_defaults = false,
        },
      },

      -- prompt_library = {
      --   ["Unit tests(pytest)"] = {
      --     strategy = "chat",
      --     description = "Generate unit tests (pytest)",
      --
      --   }
      -- }
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/codecompanion-history.nvim"
    },
  },
}
