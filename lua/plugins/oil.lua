-- luaConfig/plugins/oil.lua
return {
	"stevearc/oil.nvim",
	opts = {
		view_options = {
			show_hidden = true,
		},
		default_file_explorer = true,
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
}
