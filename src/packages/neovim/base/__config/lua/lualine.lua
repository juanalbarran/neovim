-- src/packages/neovim/light/__config/lua/lualine.lua
require("lualine").setup({
	options = {
		globalstatus = true,
		refresh = {
			statusline = 100,
		},
	},
	sections = {
		lualine_a = {
			{ "mode", width = 6 },
		},
		lualine_b = {
			{ "branch" },
			{ "diff" },
		},
		lualine_c = {
			{ "cwd", substitute_home = true },
			{ "filename", path = 1 },
		},
		lualine_x = {
			{ "macro" },
			{ "diagnostics" },
			{ "searchcount" },
			{ "location" },
			{
				"rest",
				icon = "",
				fg = "#428890",
			},
		},
		lualine_y = {
			{ "filetype" },
		},
		lualine_z = {
			{ "lsp_servers" },
		},
	},
})
