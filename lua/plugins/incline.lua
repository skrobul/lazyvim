return {
  {
    "b0o/incline.nvim",
    dependencies = { "folke/tokyonight.nvim" },
    event = "VeryLazy",
    priority = 10,
    config = function()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = {  default = true, guifg = "#ff000"},
            InclineNormalNC = { default = true, guifg = "#ff000"},
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })

      -- setup autocmd to fix highlightgroups when the colorscheme is changed
      -- or there is a race condition when loading file
      -- https://jdhao.github.io/2020/09/22/highlight_groups_cleared_in_nvim/
      local colors = require("tokyonight.colors").setup({ style = "moon" })
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          vim.api.nvim_set_hl(0, "InclineNormal", { fg = colors.bg_dark, bg = colors.magenta2 })
          vim.api.nvim_set_hl(0, "InclineNormalNC", {  fg = colors.fg, bg = colors.bg_dark })
        end
      })
    end,
  },
}
