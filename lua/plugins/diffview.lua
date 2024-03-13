return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewFileHistory", "DiffviewOpen", "DiffviewFocusFiles", "DiffviewLog" },
    event = "VeryLazy",
    keys = {
      { "<leader>c", false, buffer = true, desc = "Conflict resolution" },
    },
  },
}
