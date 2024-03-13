return {
  {
    "johnfrankmorgan/whitespace.nvim",
    opts = {
      -- configuration options and their defaults

      -- `highlight` configures which highlight is used to display
      -- trailing whitespace
      highlight = "DiffDelete",

      -- `ignored_filetypes` configures which filetypes to ignore when
      -- displaying trailing whitespace
      ignored_filetypes = {
        "TelescopePrompt",
        "Trouble",
        "help",
        "mason",
        "lazy",
        "WhichKey",
        "alpha",
        "gitcommit",
        "toggleterm",
        "dap-repl",
        "telescopeprompt",
      },

      -- `ignore_terminal` configures whether to ignore terminal buffers
      ignore_terminal = true,
    },
    config = function(_, opts)
      require("whitespace-nvim").setup(opts)
      require("which-key").register({
        ["<leader>lt"] = { require("whitespace-nvim").trim, "Trim whitespace" },
        {},
      })
    end,
    event = "VeryLazy",
  },
}
