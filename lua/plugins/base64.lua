return {
  "deponian/nvim-base64",
  version = "*",
  keys = {
    -- Decode/encode selected sequence from/to base64
    -- (mnemonic: code[b]ase64)
    { "<Leader>cb", "<Plug>(FromBase64)", mode = "x" },
    { "<Leader>cB", "<Plug>(ToBase64)", mode = "x" },
  },
  config = function()
    require("nvim-base64").setup()
  end,
}
