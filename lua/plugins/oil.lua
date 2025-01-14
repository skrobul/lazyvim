return {
  {
  'stevearc/oil.nvim',
  opts = {
        watch_for_changes = true,
        default_file_explorer = true
    },
  cmd = "Oil",
  keys = {
      { "<leader>fo", "<cmd>Oil --float<CR>", desc = "Oil (float)"},
      { "<leader>fO", "<cmd>Oil<CR>", desc = "Oil (float)"},
    },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  }
}
