-- src/packages/neovim/salesforce/__config/lua/sf-nvim.lua

-- 1. Silence the CLI to prevent JSON parsing crashes on startup
vim.env.SF_UPDATE_INSTRUCTIONS = "false"
vim.env.SF_AUTOUPDATE_DISABLE = "true"
vim.env.FORCE_COLOR = "0"
vim.env.NODE_NO_WARNINGS = "1"

-- 2. Ensure leader is set BEFORE keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 3. Setup sf.nvim
local status_ok, sf = pcall(require, "sf")
if not status_ok then
  return
end

sf.setup({
  enable_hotkeys = false,
  hotkeys_in_filetypes = { "apex", "sosl", "soql", "javascript", "html" },
  fetch_org_list_at_nvim_start = false, -- Leave off while testing
})

-- 4. Keymaps
vim.keymap.set("n", "<leader>sf", "<cmd>SF<CR>", { desc = "Open Salesforce Menu" })
