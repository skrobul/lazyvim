return {
  "ovk/endec.nvim",
  version = "*",
  event = "VeryLazy",
  opts = {
    -- Key mappings.
    -- Mapping 	Description
    -- Defaults:
    -- gb 	Decode Base64 in a popup
    -- gyb 	Decode Base64 in-place
    -- gB 	Encode Base64 in-place
    -- gs 	Decode Base64URL in a popup
    -- gys 	Decode Base64URL in-place
    -- gS 	Encode Base64URL in-place
    -- gl 	Decode URL in a popup
    -- gyl 	Decode URL in-place
    -- gL 	Encode URL in-lace
    keymaps = {
      defaults = false,
      -- Decode Base64 in-place (normal mode)
      decode_base64_inplace = "<Leader>cbd",

      -- Decode Base64 in-place (visual mode)
      vdecode_base64_inplace = "<Leader>cbd",

      -- Decode Base64 in a popup (normal mode)
      decode_base64_popup = "<Leader>cbD",

      -- Decode Base64 in a popup (visual mode)
      vdecode_base64_popup = "<Leader>cbd",

      -- Encode Base64 in-place (normal mode)
      encode_base64_inplace = "<Leader>cbe",

      -- Encode Base64 in-place (visual mode)
      vencode_base64_inplace = "<Leader>cbe",

      -- Decode Base64URL in-place (normal mode)
      decode_base64url_inplace = "<Leader>cbud",

      -- Decode Base64URL in-place (visual mode)
      vdecode_base64url_inplace = "<Leader>cbud",

      -- Decode Base64URL in a popup (normal mode)
      decode_base64url_popup = "<Leader>cbup",

      -- Decode Base64URL in a popup (visual mode)
      vdecode_base64url_popup = "<Leader>cbup",

      -- Encode Base64URL in-place (normal mode)
      encode_base64url_inplace = "<leader>cbue",

      -- Encode Base64URL in-place (visual mode)
      vencode_base64url_inplace = "<leader>cbue",

      -- Decode URL in-place (normal mode)
      decode_url_inplace = "<leader>cud",

      -- Decode URL in-place (visual mode)
      vdecode_url_inplace = "<leader>cud",

      -- Decode URL in a popup (normal mode)
      decode_url_popup = "<leader>cud",

      -- Decode URL in a popup (visual mode)
      vdecode_url_popup = "<leader>cup",

      -- Encode URL in-place (normal mode)
      encode_url_inplace = "<leader>cue",

      -- Encode URL in-place (visual mode)
      vencode_url_inplace = "<leader>cue",
    },
  },
}
