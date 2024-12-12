return {
  {
    "folke/flash.nvim",
    enabled = true,
    opts = {
      modes = {
        search = {
          enabled = false,
        },
        char = {
          enabled = true,
        },
      },
    },
    keys = {
      -- disable the default flash keymap as it breaks the surround
      -- { "s", mode = { "n", "x", "o" }, false },
    },
  },
}
