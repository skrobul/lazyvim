return {
  { "nvim-neotest/neotest-python" },
  { "olimorris/neotest-rspec" },
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/nvim-nio" },
    opts = { adapters = { "neotest-python", "neotest-rspec" } },
  },
}
