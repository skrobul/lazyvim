local ls = require("luasnip")

return {
  "L3MON4D3/LuaSnip",
  lazy = true,
  dependencies = {
    {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
        require("luasnip.loaders.from_lua").lazy_load({ paths = { vim.fn.stdpath("config") .. "/luasnippets" } })
      end,
    },
  },
  keys = {
    {
      "<c-e>",
      function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end,
      desc = "Change snippet choice",
      silent = false,
      mode = { "i", "s" },
    },
  },
  opts = {
    history = true,
    delete_check_events = "TextChanged",
  },
}
