return {
  { "nvim-neotest/neotest-python" },
  { "olimorris/neotest-rspec" },
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-python", "neotest-rspec" } },
  },
}
