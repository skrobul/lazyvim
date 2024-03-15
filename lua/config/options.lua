-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.spellfile = "~/dotfiles/vim/spell/en.utf-8.add"
opt.listchars = { tab = ">~", nbsp = "␣", trail = "•", extends = "⟩", precedes = "⟨" }
opt.showbreak = "↪"
opt.showmatch = true
-- wildignore node_modules
opt.wildignore:append("**/node_modules")

-- overcommit - no colors
vim.env.OVERCOMMIT_COLOR = 0

opt.titlelen = 15
opt.relativenumber = false

-- no autoformatting by default
vim.g.autoformat = false
