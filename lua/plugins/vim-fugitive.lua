return {
  "tpope/vim-fugitive",
  keys = {
    { "<leader>gg", ":G<CR>" },
  },
  lazy = false,
  cmd = { "G", "Git" },
  init = function()
    -- Only apply inside gitrebase buffers
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "gitrebase",
      callback = function()
        vim.keymap.set("n", "<CR>", ":Cycle<CR>", { buffer = true, noremap = true, silent = true })
      end,
    })
    -- Fugitive status buffer: <Tab> behaves like "=" (inline diff toggle)
    -- Use Fugitive’s post-index event so Fugitive’s own maps are already set.
    vim.api.nvim_create_autocmd("User", {
      pattern = "FugitiveIndex",
      callback = function(ev)
        local buf = ev.buf or 0
        -- If something else bound <Tab> here, clear it safely
        pcall(vim.api.nvim_buf_del_keymap, buf, "n", "<Tab>")
        -- Send count-prefixed "=" so Fugitive’s "=" map runs
        vim.keymap.set("n", "<Tab>", function()
          local cnt = vim.v.count > 0 and tostring(vim.v.count) or ""
          return cnt .. "="
        end, {
          buffer = buf,
          expr = true,
          remap = true,
          silent = true,
          nowait = true,
          desc = "Inline diff (Tab)",
        })
      end,
    })
  end,
}
