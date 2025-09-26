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
      fullscreen = true,
      preview = {
        border = "border-top",
        hidden = true, -- use alt-p to show
      },
    },
  },
}
