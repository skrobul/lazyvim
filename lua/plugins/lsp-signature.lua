return {
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    opts = {
      floating_window = false,
      toggle_key = "<C-s>",
      toggle_key_flip_floatwin_setting = true,
      hint_inline = function()
        return false
      end, -- this has to wait for neovim 0.10.0 release
    },
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
}
