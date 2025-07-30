return {
  {
    "NeogitOrg/neogit",
    -- dev = true,
    -- dir = "/home/skrobul/devel/neogit/",
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
      mappings = {
        rebase_editor = {
          ["p"] = "Pick",
          ["r"] = "Reword",
          ["e"] = "Edit",
          ["s"] = "Squash",
          ["f"] = "Fixup",
          ["x"] = "Execute",
          ["d"] = "Drop",
          ["b"] = "Break",
          ["q"] = "Close",
          ["<cr>"] = "OpenCommit",
          ["<c-p>"] = "MoveUp",
          ["<c-n>"] = "MoveDown",
          ["<c-c><c-c>"] = "Submit",
          ["<c-c><c-k>"] = "Abort",
          ["[c"] = "OpenOrScrollUp",
          ["]c"] = "OpenOrScrollDown",
        },
      },
    },
  },
}
