-- src/packages/neovim/java/__config/lua/java-creator.lua
local status_ok, java_creator = pcall(require, "java-creator-nvim")
if not status_ok then
	return
end

java_creator.setup({
	options = {
		-- Setting this to match the JavaSE-21 from your nvim-java config
		java_version = 21,
		-- Automatically open the file after generating the boilerplate
		auto_open = true,
	},
})

-- Keymaps using your existing <leader> (which is space)
vim.keymap.set("n", "<leader>jc", "<cmd>JavaClass<CR>", { desc = "[J]ava [C]lass", noremap = true, silent = true })
vim.keymap.set(
	"n",
	"<leader>ji",
	"<cmd>JavaInterface<CR>",
	{ desc = "[J]ava [I]nterface", noremap = true, silent = true }
)
vim.keymap.set("n", "<leader>je", "<cmd>JavaEnum<CR>", { desc = "[J]ava [E]num", noremap = true, silent = true })
vim.keymap.set("n", "<leader>jr", "<cmd>JavaRecord<CR>", { desc = "[J]ava [R]ecord", noremap = true, silent = true })
