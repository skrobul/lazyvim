return {
  "ibhagwan/fzf-lua",
  config = function(_, opts)
    require("fzf-lua").setup(opts)
    require("fzf-lua").register_ui_select()
  end,
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
