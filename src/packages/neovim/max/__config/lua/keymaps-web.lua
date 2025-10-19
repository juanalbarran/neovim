-- src/packages/neovim/max/__config/lua/keymaps-web.lua
local vtsls = require("vtsls").commands
vim.keymap.set(
	"n",
	"<leader>io",
	vtsls.organize_imports,
	{ noremap = true, silent = true, desc = "[I]mports: [O]rganize" }
)
vim.keymap.set("n", "<leader>is", vtsls.sort_imports, { noremap = true, silent = true, desc = "[I]mports: [S]ort" })
vim.keymap.set(
	"n",
	"<leader>ir",
	vtsls.remove_unused_imports,
	{ noremap = true, silent = true, desc = "[I]mports: [R]emove unused" }
)
vim.keymap.set(
	"n",
	"<leader>ia",
	vtsls.add_missing_imports,
	{ noremap = true, silent = true, desc = "[I]mports: [A]dd missing ones" }
)
