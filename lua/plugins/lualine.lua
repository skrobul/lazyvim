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
      table.insert(opts.sections.lualine_x, get_schema)
      -- table.remove(opts.sections.lualine_c)
      -- table.insert(opts.sections.lualine_c, {
      --   "filename",
      --   path = 4,
      -- })
      -- we want to completely replace the lualine_c section
      -- opts.sections.lualine_c = { { "filename", path = 4 }}
      opts.inactive_sections = { lualine_c = {} }
      table.insert(opts.inactive_sections.lualine_c, { "filename", path = 4})

      opts.sections.lualine_z = {}
    end,
  },
}
