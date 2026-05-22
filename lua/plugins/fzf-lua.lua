return {
  "ibhagwan/fzf-lua",
  opts = {
    -- files = {
    --   previewer = false,
    -- },
    defaults = {
      keymap = {
        builtin = {
          ["<M-p>"] = "toggle-preview",
        },
      },
    },
    winopts = {
      fullscreen = false,
      preview = {
        border = "border-top",
        hidden = true, -- use alt-p to show
      },
    },
  },
}
