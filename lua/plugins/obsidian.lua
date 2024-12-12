return {
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
  },
}
