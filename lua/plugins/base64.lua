return {
  "deponian/nvim-base64",
  version = "*",
  keys = {
    -- Decode/encode selected sequence from/to base64
    -- (mnemonic: code[b]ase64)
    { "<Leader>cbd", "<Plug>(FromBase64)", mode = "x", desc = "Decode B64" },
    { "<Leader>cbe", "<Plug>(ToBase64)", mode = "x", desc = "Encode B64" },
  },
  config = function()
    require("nvim-base64").setup()
  end,
}
