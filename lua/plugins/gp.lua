return {
  "robitx/gp.nvim",
  config = function()
    local uname = vim.loop.os_uname().sysname

    local conf = {
      providers = {
        groq = {
          disable = false,
          endpoint = "https://api.groq.com/openai/v1/chat/completions",
          secret = { "rbw", "get", "console.groq.com" },
        },
        openai = {
          disable = false,
          endpoint = "https://api.openai.com/v1/chat/completions",
          secret = { "rbw", "get", "platform.openai.com API key" },
        },
        ollama = {
          disable = false,
          endpoint = "http://localhost:11434/v1/chat/completions",
          secret = "dummy_secret",
        },
        openrouter = {
          disable = false,
          endpoint = "https://openrouter.ai/api/v1/chat/completions",
          secret = { "rbw", "get", "openrouter.ai API key" },
        },
      },
      agents = {
        {
          name = "qwen2.5-coder:14-ollama-code",
          provider = "ollama",
          chat = true,
          command = true,
          model = {
            model = "qwen2.5-coder:14b",
            temperature = 0.4,
            top_p = 1,
            min_p = 0.05,
          },
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
        {
          name = "llama3.2:latest-ollama-chat",
          provider = "ollama",
          chat = true,
          command = false,
          model = {
            model = "llama3.2:latest",
            temperature = 0.6,
            top_p = 1,
            min_p = 0.05,
          },
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
        {
          name = "llama3.2:latest-ollama-code",
          provider = "ollama",
          chat = false,
          command = true,
          model = {
            model = "llama3.2:latest",
            temperature = 0.4,
            top_p = 1,
            min_p = 0.05,
          },
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
        {
          name = "ChatGroqLlama3.3-70B",
          provider = "groq",
          chat = true,
          command = false,
          -- string with model name or table with model name and parameters
          model = {
            model = "llama-3.3-70b-versatile",
            temperature = 0.6,
            top_p = 1,
            min_p = 0.05,
          },
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
        {
          name = "CodeGroqLlama3.3-70B",
          provider = "groq",
          chat = false,
          command = true,
          model = {
            model = "llama-3.3-70b-versatile",
            temperature = 0.4,
            top_p = 1,
            min_p = 0.05,
          },
          system_prompt = require("gp.defaults").code_system_prompt,
        },
        {
          name = "ChatGPT4o",
          chat = true,
          command = false,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
        {
          provider = "ollama",
          name = "deepseek-r1:14b",
          chat = true,
          command = false,
          -- string with model name or table with model name and parameters
          model = {
            model = "deepseek-r1:14b",
            temperature = 0.4,
            top_p = 1,
            min_p = 0.05,
          },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").code_system_prompt,
        },

        ---
        --- CODE models
        ---
        {
          provider = "openai",
          name = "ChatGPT4o-mini",
          chat = true,
          command = false,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-4o-mini", temperature = 1.1, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
        {
          provider = "openai",
          name = "CodeGPT4o-mini",
          chat = false,
          command = true,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-4o-mini", temperature = 0.7, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = "Please return ONLY code snippets.\nSTART AND END YOUR ANSWER WITH:\n\n```",
        },
        {
          provider = "openai",
          name = "CodeGPT4o",
          chat = false,
          command = true,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-4o", temperature = 0.8, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").code_system_prompt,
        },
        {
          provider = "ollama",
          name = "deepseek-coder-v2:16b",
          chat = false,
          command = true,
          -- string with model name or table with model name and parameters
          model = {
            model = "deepseek-coder-v2:16b",
            temperature = 0.6,
            top_p = 1,
            min_p = 0.05,
          },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").code_system_prompt,
        },
        {
          provider = "ollama",
          name = "code-deepseek-r1:14b",
          chat = false,
          command = true,
          -- string with model name or table with model name and parameters
          model = {
            model = "deepseek-r1:14b",
            temperature = 0.6,
            top_p = 1,
            min_p = 0.05,
          },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").code_system_prompt,
        },
        {
          provider = "openrouter",
          name = "openrouter llama3-8b-instruct",
          chat = false,
          command = true,
          -- string with model name or table with model name and parameters
          model = {
            model = "meta-llama/llama-3-8b-instruct:free",
            temperature = 0.6,
            top_p = 1,
            min_p = 0.05,
          },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").code_system_prompt,
        },
        {
          provider = "openrouter",
          name = "openrouter llama3-8b-instruct",
          chat = true,
          command = true,
          -- string with model name or table with model name and parameters
          model = {
            model = "meta-llama/llama-3-8b-instruct:free",
            temperature = 0.6,
            top_p = 1,
            min_p = 0.05,
          },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").code_system_prompt,
        },
      },
      -- default agent names set during startup, if nil last used agent is used
      -- default_command_agent = "CodeGroqLlama3.1-70B",
      -- default_chat_agent = "ChatGroqLlama3.1-70B",
      log_sensitive = false,

      whisper = {},
    }
    if uname == "Darwin" then
      conf.whisper.rec_cmd = { "ffmpeg", "-y", "-f", "avfoundation", "-i", ":0", "-t", "3600", "rec.wav" }
    elseif uname == "Linux" then
      conf.whisper.rec_cmd = { "ffmpeg", "-y", "-f", "pulse", "-i", ":0", "-t", "3600", "rec.wav" }
    end
    require("gp").setup(conf)

    -- disable diagnostics for markdown
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
      pattern = { vim.fn.expand("~/") .. ".local/share/nvim/gp/chats/*" },
      callback = function(event)
        local buf = event.buf
        vim.diagnostic.enable(false, { bufnr = buf })
      end,
    })

    vim.api.nvim_create_user_command("GpSelectAgent", function()
      local buf = vim.api.nvim_get_current_buf()
      local file_name = vim.api.nvim_buf_get_name(buf)
      local is_chat = require("gp").not_chat(buf, file_name) == nil
      local models = is_chat and require("gp")._chat_agents or require("gp")._command_agents
      local prompt_title = is_chat and 'Chat Models' or 'Completion Models'
      require("fzf-lua").fzf_exec(models, {
        prompt = prompt_title,
        actions = {
          ["default"] = function(selected, _)
            require("gp").cmd.Agent({ args = selected[1] })
          end,
        },
      })
    end, {})
  end,
  cmd = {
    "GpChatNew",
    "GpChatPaste",
    "GpChatToggle",
    "GpChatFinder",
    "GpChatRespond",
    "GpChatDelete",
    "GpRewrite",
    "GpAppend",
    "GpPrepend",
    "GpEnew",
    "GpNew",
    "GpVnew",
    "GpTabnew",
    "GpPopup",
    "GpImplement",
    "GpContext",
    "GpSelectAgent",
    "GpWhisper",
    "GpWhisperRewrite",
    "GpWhisperAppend",
    "GpWhisperPrepend",
    "GpWhisperEnew",
    "GpWhisperNew",
    "GpWhisperVnew",
    "GpWhisperTabnew",
    "GpWhisperPopup",
  },
  keys = {
    {
      "<C-g><C-t>",
      ":<C-u>'<,'>GpChatNew tabnew<cr>",
      desc = "ChatNew tabnew",
      mode = "v",
      nowait = true,
      remap = false,
    },
    {
      "<C-g><C-v>",
      ":<C-u>'<,'>GpChatNew vsplit<cr>",
      desc = "ChatNew vsplit",
      mode = "v",
      nowait = true,
      remap = false,
    },
    {
      "<C-g><C-x>",
      ":<C-u>'<,'>GpChatNew split<cr>",
      desc = "ChatNew split",
      mode = "v",
      nowait = true,
      remap = false,
    },
    { "<C-g>a", ":<C-u>'<,'>GpAppend<cr>", desc = "Visual Append (after)", mode = "v", nowait = true, remap = false },
    {
      "<C-g>b",
      ":<C-u>'<,'>GpPrepend<cr>",
      desc = "Visual Prepend (before)",
      mode = "v",
      nowait = true,
      remap = false,
    },
    { "<C-g>c", ":<C-u>'<,'>GpChatNew<cr>", desc = "Visual Chat New", mode = "v", nowait = true, remap = false },
    { "<C-g>g", group = "generate into new ..", mode = "v", nowait = true, remap = false },
    { "<C-g>ge", ":<C-u>'<,'>GpEnew<cr>", desc = "Visual GpEnew", mode = "v", nowait = true, remap = false },
    { "<C-g>gn", ":<C-u>'<,'>GpNew<cr>", desc = "Visual GpNew", mode = "v", nowait = true, remap = false },
    { "<C-g>gp", ":<C-u>'<,'>GpPopup<cr>", desc = "Visual Popup", mode = "v", nowait = true, remap = false },
    { "<C-g>gt", ":<C-u>'<,'>GpTabnew<cr>", desc = "Visual GpTabnew", mode = "v", nowait = true, remap = false },
    { "<C-g>gv", ":<C-u>'<,'>GpVnew<cr>", desc = "Visual GpVnew", mode = "v", nowait = true, remap = false },
    { "<C-g>i", ":<C-u>'<,'>GpImplement<cr>", desc = "Implement selection", mode = "v", nowait = true, remap = false },
    { "<C-g>n", "<cmd>GpNextAgent<cr>", desc = "Next Agent", mode = "v", nowait = true, remap = false },
    { "<C-g>p", ":<C-u>'<,'>GpChatPaste<cr>", desc = "Visual Chat Paste", mode = "v", nowait = true, remap = false },
    { "<C-g>r", ":<C-u>'<,'>GpRewrite<cr>", desc = "Visual Rewrite", mode = "v", nowait = true, remap = false },
    { "<C-g>s", "<cmd>GpStop<cr>", desc = "GpStop", mode = "v", nowait = true, remap = false },
    { "<C-g>t", ":<C-u>'<,'>GpChatToggle<cr>", desc = "Visual Toggle Chat", mode = "v", nowait = true, remap = false },
    { "<C-g>w", group = "Whisper", mode = "v", nowait = true, remap = false },
    { "<C-g>wa", ":<C-u>'<,'>GpWhisperAppend<cr>", desc = "Whisper Append", mode = "v", nowait = true, remap = false },
    {
      "<C-g>wb",
      ":<C-u>'<,'>GpWhisperPrepend<cr>",
      desc = "Whisper Prepend",
      mode = "v",
      nowait = true,
      remap = false,
    },
    { "<C-g>we", ":<C-u>'<,'>GpWhisperEnew<cr>", desc = "Whisper Enew", mode = "v", nowait = true, remap = false },
    { "<C-g>wn", ":<C-u>'<,'>GpWhisperNew<cr>", desc = "Whisper New", mode = "v", nowait = true, remap = false },
    { "<C-g>wp", ":<C-u>'<,'>GpWhisperPopup<cr>", desc = "Whisper Popup", mode = "v", nowait = true, remap = false },
    {
      "<C-g>wr",
      ":<C-u>'<,'>GpWhisperRewrite<cr>",
      desc = "Whisper Rewrite",
      mode = "v",
      nowait = true,
      remap = false,
    },
    { "<C-g>wt", ":<C-u>'<,'>GpWhisperTabnew<cr>", desc = "Whisper Tabnew", mode = "v", nowait = true, remap = false },
    { "<C-g>wv", ":<C-u>'<,'>GpWhisperVnew<cr>", desc = "Whisper Vnew", mode = "v", nowait = true, remap = false },
    { "<C-g>ww", ":<C-u>'<,'>GpWhisper<cr>", desc = "Whisper", mode = "v", nowait = true, remap = false },
    { "<C-g>x", ":<C-u>'<,'>GpContext<cr>", desc = "Visual GpContext", mode = "v", nowait = true, remap = false },
    -- normal mode mappings
    { "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>", desc = "New Chat tabnew", mode = "n", nowait = true, remap = false },
    { "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit", mode = "n", nowait = true, remap = false },
    { "<C-g><C-x>", "<cmd>GpChatNew split<cr>", desc = "New Chat split", mode = "n", nowait = true, remap = false },
    { "<C-g>a", "<cmd>GpAppend<cr>", desc = "Append (after)", mode = "n", nowait = true, remap = false },
    { "<C-g>b", "<cmd>GpPrepend<cr>", desc = "Prepend (before)", mode = "n", nowait = true, remap = false },
    { "<C-g>c", "<cmd>GpChatNew<cr>", desc = "New Chat", mode = "n", nowait = true, remap = false },
    { "<C-g>f", "<cmd>GpChatFinder<cr>", desc = "Chat Finder", mode = "n", nowait = true, remap = false },
    { "<C-g>g", group = "generate into new ..", mode = "n", nowait = true, remap = false },
    { "<C-g>ge", "<cmd>GpEnew<cr>", desc = "GpEnew", mode = "n", nowait = true, remap = false },
    { "<C-g>gn", "<cmd>GpNew<cr>", desc = "GpNew", mode = "n", nowait = true, remap = false },
    { "<C-g>gp", "<cmd>GpPopup<cr>", desc = "Popup", mode = "n", nowait = true, remap = false },
    { "<C-g>gt", "<cmd>GpTabnew<cr>", desc = "GpTabnew", mode = "n", nowait = true, remap = false },
    { "<C-g>gv", "<cmd>GpVnew<cr>", desc = "GpVnew", mode = "n", nowait = true, remap = false },
    { "<C-g>n", "<cmd>GpNextAgent<cr>", desc = "Next Agent", mode = "n", nowait = true, remap = false },
    { "<C-g>r", "<cmd>GpRewrite<cr>", desc = "Inline Rewrite", mode = "n", nowait = true, remap = false },
    { "<C-g>s", "<cmd>GpStop<cr>", desc = "GpStop", mode = "n", nowait = true, remap = false },
    { "<C-g>t", "<cmd>GpChatToggle<cr>", desc = "Toggle Chat", mode = "n", nowait = true, remap = false },
    { "<C-g>o", "<cmd>GpSelectAgent<cr>", desc = "Select Agent", mode = "n", nowait = true, remap = false },
    { "<C-g>w", group = "Whisper", mode = "n", nowait = true, remap = false },
    {
      "<C-g>wa",
      "<cmd>GpWhisperAppend<cr>",
      desc = "Whisper Append (after)",
      mode = "n",
      nowait = true,
      remap = false,
    },
    {
      "<C-g>wb",
      "<cmd>GpWhisperPrepend<cr>",
      desc = "Whisper Prepend (before)",
      mode = "n",
      nowait = true,
      remap = false,
    },
    { "<C-g>we", "<cmd>GpWhisperEnew<cr>", desc = "Whisper Enew", mode = "n", nowait = true, remap = false },
    { "<C-g>wn", "<cmd>GpWhisperNew<cr>", desc = "Whisper New", mode = "n", nowait = true, remap = false },
    { "<C-g>wp", "<cmd>GpWhisperPopup<cr>", desc = "Whisper Popup", mode = "n", nowait = true, remap = false },
    {
      "<C-g>wr",
      "<cmd>GpWhisperRewrite<cr>",
      desc = "Whisper Inline Rewrite",
      mode = "n",
      nowait = true,
      remap = false,
    },
    { "<C-g>wt", "<cmd>GpWhisperTabnew<cr>", desc = "Whisper Tabnew", mode = "n", nowait = true, remap = false },
    { "<C-g>wv", "<cmd>GpWhisperVnew<cr>", desc = "Whisper Vnew", mode = "n", nowait = true, remap = false },
    { "<C-g>ww", "<cmd>GpWhisper<cr>", desc = "Whisper", mode = "n", nowait = true, remap = false },
    { "<C-g>x", "<cmd>GpContext<cr>", desc = "Toggle GpContext", mode = "n", nowait = true, remap = false },

    -- INSERT mode mappings
    { "<C-g><C-t>", "<cmd>GpChatNew tabnew<cr>", desc = "New Chat tabnew", mode = "i", nowait = true, remap = false },
    { "<C-g><C-v>", "<cmd>GpChatNew vsplit<cr>", desc = "New Chat vsplit", mode = "i", nowait = true, remap = false },
    { "<C-g><C-x>", "<cmd>GpChatNew split<cr>", desc = "New Chat split", mode = "i", nowait = true, remap = false },
    { "<C-g>a", "<cmd>GpAppend<cr>", desc = "Append (after)", mode = "i", nowait = true, remap = false },
    { "<C-g>b", "<cmd>GpPrepend<cr>", desc = "Prepend (before)", mode = "i", nowait = true, remap = false },
    { "<C-g>c", "<cmd>GpChatNew<cr>", desc = "New Chat", mode = "i", nowait = true, remap = false },
    { "<C-g>f", "<cmd>GpChatFinder<cr>", desc = "Chat Finder", mode = "i", nowait = true, remap = false },
    { "<C-g>g", group = "generate into new ..", mode = "i", nowait = true, remap = false },
    { "<C-g>ge", "<cmd>GpEnew<cr>", desc = "GpEnew", mode = "i", nowait = true, remap = false },
    { "<C-g>gn", "<cmd>GpNew<cr>", desc = "GpNew", mode = "i", nowait = true, remap = false },
    { "<C-g>gp", "<cmd>GpPopup<cr>", desc = "Popup", mode = "i", nowait = true, remap = false },
    { "<C-g>gt", "<cmd>GpTabnew<cr>", desc = "GpTabnew", mode = "i", nowait = true, remap = false },
    { "<C-g>gv", "<cmd>GpVnew<cr>", desc = "GpVnew", mode = "i", nowait = true, remap = false },
    { "<C-g>n", "<cmd>GpNextAgent<cr>", desc = "Next Agent", mode = "i", nowait = true, remap = false },
    { "<C-g>r", "<cmd>GpRewrite<cr>", desc = "Inline Rewrite", mode = "i", nowait = true, remap = false },
    { "<C-g>s", "<cmd>GpStop<cr>", desc = "GpStop", mode = "i", nowait = true, remap = false },
    { "<C-g>t", "<cmd>GpChatToggle<cr>", desc = "Toggle Chat", mode = "i", nowait = true, remap = false },
    { "<C-g>w", group = "Whisper", mode = "i", nowait = true, remap = false },
    {
      "<C-g>wa",
      "<cmd>GpWhisperAppend<cr>",
      desc = "Whisper Append (after)",
      mode = "i",
      nowait = true,
      remap = false,
    },
    {
      "<C-g>wb",
      "<cmd>GpWhisperPrepend<cr>",
      desc = "Whisper Prepend (before)",
      mode = "i",
      nowait = true,
      remap = false,
    },
    { "<C-g>we", "<cmd>GpWhisperEnew<cr>", desc = "Whisper Enew", mode = "i", nowait = true, remap = false },
    { "<C-g>wn", "<cmd>GpWhisperNew<cr>", desc = "Whisper New", mode = "i", nowait = true, remap = false },
    { "<C-g>wp", "<cmd>GpWhisperPopup<cr>", desc = "Whisper Popup", mode = "i", nowait = true, remap = false },
    {
      "<C-g>wr",
      "<cmd>GpWhisperRewrite<cr>",
      desc = "Whisper Inline Rewrite",
      mode = "i",
      nowait = true,
      remap = false,
    },
    { "<C-g>wt", "<cmd>GpWhisperTabnew<cr>", desc = "Whisper Tabnew", mode = "i", nowait = true, remap = false },
    { "<C-g>wv", "<cmd>GpWhisperVnew<cr>", desc = "Whisper Vnew", mode = "i", nowait = true, remap = false },
    { "<C-g>ww", "<cmd>GpWhisper<cr>", desc = "Whisper", mode = "i", nowait = true, remap = false },
    { "<C-g>x", "<cmd>GpContext<cr>", desc = "Toggle GpContext", mode = "i", nowait = true, remap = false },
  },
}
