-- src/packages/neovim/java/__config/lua/java-creator.lua
local java_creator = require("java-creator-nvim")
java_creator.setup({
	options = {
		java_version = 21,
		auto_open = true,
	},
})

vim.keymap.set("n", "<leader>jc", "<cmd>JavaClass<CR>", { desc = "[J]ava [C]lass", noremap = true, silent = true })
vim.keymap.set(
	"n",
	"<leader>ji",
	"<cmd>JavaInterface<CR>",
	{ desc = "[J]ava [I]nterface", noremap = true, silent = true }
)
vim.keymap.set("n", "<leader>je", "<cmd>JavaEnum<CR>", { desc = "[J]ava [E]num", noremap = true, silent = true })
vim.keymap.set("n", "<leader>jr", "<cmd>JavaRecord<CR>", { desc = "[J]ava [R]ecord", noremap = true, silent = true })
