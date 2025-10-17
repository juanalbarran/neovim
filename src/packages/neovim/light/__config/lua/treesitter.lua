require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	ensure_installed = {
		"bash",
		"markdown",
		"markdown_inline",
		"regex",
		"lua",
		"luadoc",
		"nix",
		"json",
		"jsonc",
		"yaml",
		"xml",
	},
})

vim.api.nvim_set_option("foldenable", true)
