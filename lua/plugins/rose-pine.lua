-- lua/plugins/rose-pine.lua
return {
  "rose-pine/neovim",
  name = "rose-pine",
  -- config = function()
  -- 	vim.cmd("colorscheme rose-pine")
  -- end,
  opts = {
    styles = {
      italic = true,
    },
    highlight_groups = {
      CurSearch = { fg = "base", bg = "leaf", inherit = false },
      Search = { fg = "text", bg = "leaf", blend = 20, inherit = false },
    },
  },
}
