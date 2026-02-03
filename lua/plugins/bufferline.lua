return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        -- mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        always_show_bufferline = true,
      },
    },
  },
}
