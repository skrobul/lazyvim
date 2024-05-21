return {
  {
    'echasnovski/mini.align',
    version = '*',
    keys = {
      {"ga", desc = "align text", mode = {"n", "v"} },
      {"gA", desc = "align text (preview)", mode = {"n", "v"} }
    },
    config = function(_, opts)
      require("mini.align").setup(opts)
    end
  },
}
