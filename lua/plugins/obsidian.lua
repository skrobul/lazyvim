return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    -- ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    cmd = {
      "ObsidianOpen",
      "ObsidianQuickSwitch",
      "ObsidianNew",
      "ObsidianToday",
      "ObsidianYesterday",
      "ObsidianDailies",
      "ObsidianTemplate",
      "ObsidianSearch",
      "ObsidianTemplate",
      "ObsidianLink",
      "ObsidianExtractNote",
      "ObsidianPasteImg",
      "ObsidianNewFromTemplate",
    },
    keys = {

      { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "Obsidian New Note" },
      { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Obsidian Backlinks" },
      { "<leader>os", "<cmd>ObsidianQuickSwitch<cr>", desc = "Obsidian Quickswitch" },
      { "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Obsidian today's daily" },
      { "<leader>ot", "<cmd>ObsidianNewFromtemplate<cr>", desc = "Obsidian new from template" },
      { "<leader>op", "<cmd>ObsidianPasteImg<cr>", desc = "Obsidian paste image" },
      { "<leader>or", "<cmd>ObsidianRename<cr>", desc = "Obsidian Rename" },
    },
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
      -- refer to `:h file-pattern` for more examples
      "BufReadPre "
        .. vim.fn.expand("~")
        .. "/Sync/notes/wiki/*.md",
      "BufNewFile " .. vim.fn.expand("~") .. "/Sync/notes/wiki/*.md",
    },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      ui = {
        enable = false, -- to make it work with render-markdown.nvim
      },
      attachments = {
        img_folder = "assets/",
      },
      workspaces = {
        {
          name = "personal",
          path = "~/Sync/notes/wiki/",
        },
      },
      daily_notes = {
        folder = "journals",
        date_format = "%Y-%m-%d",
      },
      templates = {
        folder = "templates-vim",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
      },
      completion = {
        -- Set to false to disable completion.
        nvim_cmp = true,
        -- Trigger completion at 2 chars.
        min_chars = 2,
      },
      -- Optional, customize how note IDs are generated given an optional title.
      ---@param title string|?
      ---@return string
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. "-" .. suffix
      end,
    },
  },
  {
    "hisbaan/dataview.nvim",
    -- only load dataview.nvim for files in your obsidian vault
    event = {
      "BufEnter " .. vim.fn.expand("~") .. "/Sync/notes/wiki/**",
    },
    -- configuration here, see below for full configuration options
    opts = {
      vault_dir = vim.fn.expand("~") .. "/Sync/notes/wiki/**",
      buffer_type = "float", -- float | split | vsplit | tab
    },
  },
}
