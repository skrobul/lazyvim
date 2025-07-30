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
      preview = {
        border = "border-top"
      }
    }
  },
}
