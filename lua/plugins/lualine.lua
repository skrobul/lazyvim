local function get_schema()
  local schema = require("yaml-companion").get_buf_schema(0)
  if schema.result[1].name == "none" then
    return ""
  end
  return schema.result[1].name
end
return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
--      table.insert(opts.sections.lualine_x, get_schema)
      -- table.remove(opts.sections.lualine_c)
      -- table.insert(opts.sections.lualine_c, {
      --   "filename",
      --   path = 4,
      -- })
      -- we want to completely replace the lualine_c section
      -- opts.sections.lualine_c = { { "filename", path = 4 }}
      local icons = LazyVim.config.icons

      opts.inactive_sections = { lualine_c = {} }
      table.insert(opts.inactive_sections.lualine_c, { "filename", path = 4})
      opts.sections.lualine_b = {} -- no need for git branch
      opts.sections.lualine_c = {
        -- LazyVim.lualine.root_dir(), -- useless root dir path
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { LazyVim.lualine.pretty_path() },
      }
        opts.sections.lualine_y = {
          -- { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 1, right = 1 } },
        }
      opts.sections.lualine_z = {}
      -- opts.options.component_separators = { left = '│', right = '│'}
      -- opts.options.section_separators = { left = '│', right = '│'}
      -- opts.options.component_separators = ''
      -- opts.options.section_separators = { left = '│', right = '│'}

      opts.options.component_separators = { left = "", right = "" }
      opts.options.section_separators = { left = "", right = "" }

      if not vim.g.trouble_lualine then
        table.insert(opts.sections.lualine_c, { "navic", color_correction = "dynamic" })
      end
    end,
  },
}
