-- src/packages/neovim/base/__config/lua/colorscheme.lua
-- vim.cmd.colorscheme('zenbones')
-- vim.cmd.colorscheme("alabaster")
require("vague").setup({
	colors = {
		bg = "#131314",
	},
})
vim.cmd.colorscheme("vague")
