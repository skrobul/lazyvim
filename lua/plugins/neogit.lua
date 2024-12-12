return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      {
        "<leader>gn",
        function()
          require("neogit").open()
        end,
        desc = "Neogit (full)",
      },
      {
        "<leader>gN",
        function()
          require("neogit").open({ kind = "split" })
        end,
        desc = "Neogit (split)",
      },
    },
    config = true,
  },
}
