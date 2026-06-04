# Neovim Config Cleanup Plan

Bugs already fixed:
- `treesitter.lua`: `config` function now passes `opts` to `ts.setup(opts)` instead of `{}`
- `obsidian.lua`: `enable = false` → `enabled = false` (lazy.nvim field was being ignored)
- `lsp-config.lua`: `jsonls` settings moved out of `setup.settings` into `settings` directly, with proper `json` nesting
- `luasnip.lua`: top-level `require("luasnip")` moved inside the keymap handler function
- `blink.lua`: unused top-level `require("luasnip")` removed entirely
- `neotest.lua`: adapters block uncommented — neotest-python and neotest-rspec now registered
- `conform.lua`: removed redundant `isort` and `black`; ruff handles both
- `codecompanion.lua`: deleted (114 lines of disabled dead config)
- `oil.lua`: fixed `<leader>fO` description from `"Oil (float)"` to `"Oil"`

---

## Bugs Still to Fix

### 1. `gp.lua` — duplicate agent name
Two agents are both named `"openrouter llama3-8b-instruct"` (around lines 186 and 201). One silently shadows the other. Rename one to distinguish chat vs command variants.

---

## Dead Files to Delete

| File | Reason |
|---|---|
| `lua/plugins/images.lua` | Just two TODO comments, no actual content |
| `lazy-lock.jsonback` | Manual lockfile backup — use git for this instead |

## Files to Collapse into `disabled.lua`

| File | Reason |
|---|---|
| `lua/plugins/noice.lua` | Only disables noice, no other content |
| `lua/plugins/auto-pairs.lua` | Only disables nvim-autopairs and mini.pairs |

## Files to Decide On

| File | Decision needed |
|---|---|
| `lua/plugins/oxide.lua` | 3-line file that just ensures markdown-oxide plugin is installed. Could be folded into `lsp-config.lua` as a dependency entry. |

---

## Intentional Overlaps to Document

These aren't bugs, but worth a comment in the relevant file so future-you doesn't wonder:

- **Two git UIs**: `vim-fugitive` (`<leader>gg`) and `neogit` (`<leader>gn/gN`) — document which is for what workflow
- **Two file explorers**: `neo-tree` and `oil.nvim` — document the intended split (e.g. oil for editing, neo-tree for browsing)
- **Telescope as yaml-companion dependency**: `lsp-config.lua` pulls in `telescope.nvim` just for the yaml schema picker. If you're not using telescope elsewhere, consider switching to the fzf-lua backend or just removing the schema picker binding.

---

## Low Priority / Nice to Have

- `lua/config/keymaps.lua` is empty. Not a bug, but if you ever want a central reference for all your custom keys, this is the place to build it.
- `lua/plugins/snacks.lua` has a dead `header` field inside an `enabled = false` dashboard block. Minor noise, safe to delete the `header` line.
