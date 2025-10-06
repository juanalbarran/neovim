return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "meuter/lualine-so-fancy.nvim" },
	opts = {
		options = {
			globalstatus = true,
			refresh = {
				statusline = 100,
			},
		},
		sections = {
			lualine_a = {
				{ "fancy_mode", width = 6 },
			},
			lualine_b = {
				{ "fancy_branch" },
				{ "fancy_diff" },
			},
			lualine_c = {
				{ "fancy_cwd", substitute_home = true },
				{ "filename", path = 1 },
			},
			lualine_x = {
				{ "fancy_macro" },
				{ "fancy_diagnostics" },
				{ "fancy_searchcount" },
				{ "fancy_location" },
				{
					"rest",
					icon = "",
					fg = "#428890",
				},
			},
			lualine_y = {
				{ "fancy_filetype" },
			},
			lualine_z = {
				{ "fancy_lsp_servers" },
			},
		},
	},
}
