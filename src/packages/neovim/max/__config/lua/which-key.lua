-- src/packages/neovim/max/__config/lua/which-key.lua
local wk = require("which-key")
wk.setup({
	preset = "helix",
})
wk.add({
	{ "<leader>f", group = "Find:" },
	{ "g", group = "LSP:" },
	{ "<leader>b", group = "Buffers:" },
})
