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
                default = "meta-llama/llama-4-scout-17b-16e-instruct",
              },
            },
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

      prompt_library = {
        ["Unit tests(pytest)"] = {
          strategy = "chat",
          description = "Generate unit tests (pytest)",
          prompts = {
            { role = "system", content = "You are an expert Python programmer." },
            {
              role = "user",
              content = [[
<user_prompt>generate unit tests for this code. validate both
success and failure, and include edge cases. the testing
framework to be used is pytest, with pytest-mock enabled. when
mocking is needed, take advantage of 'mocker' fixture. don't
include any comments in the code. keep it simple and
concise. Make sure to preserve indentation where it is relevant. </user_prompt>
]],
            },
          },
        },
        ["Code review"] = {
          strategy = "chat",
          description = "Review this code",
          prompts = {
            {
              role = "user",
              content = [[
I want you to act as a Code reviewer who is experienced developer in the given
code language. I will provide you with the code block or methods or code file
along with the code language name, and I would like you to review the code and
share the feedback, suggestions and alternative recommended approaches. Please
write explanations behind the feedback or suggestions or alternative
approaches. Reply in English using professional tone for everyone. Make sure to
preserve indentation where it is relevant.
]],
            },
          },
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/codecompanion-history.nvim",
    },
  },
}
