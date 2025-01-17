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
          require("neogit").open({ cwd = LazyVim.root.git() })
        end,
        desc = "Neogit (full)",
      },
      {
        "<leader>gN",
        function()
          require("neogit").open({ kind = "split", cwd = LazyVim.root.git() })
        end,
        desc = "Neogit (split)",
      },
    },
    opts = {
      graph_style = "kitty",
      git_services = {
        ["github.com"] = "https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1",
        ["github.rackspace.com"] = "https://github.rackspace.com/${owner}/${repository}/compare/${branch_name}?expand=1",
      },
      disable_insert_on_commit = false,
    },
  },
}
