return {
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        search = {
          enabled = false,
        },
        char = {
          enabled = false,
        },
      },
    },
    keys = {
      -- disable the default flash keymap as it breaks the surround
      -- { "s", mode = { "n", "x", "o" }, false },
    },
  },
}
