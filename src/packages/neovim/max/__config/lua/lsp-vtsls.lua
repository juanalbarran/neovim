-- src/packages/neovim/max/__config/lua/lsp-vtsls.lua
local baseConfig = require("vtsls").lspconfig
local customConfig = {
	typescript = {
		preferences = {
			autoImportSpecifierExcludeRegexes = { "@mui\\/system" },
		},
	},
}
local config = vim.tbl_deep_extend("force", baseConfig, customConfig)

vim.lsp.config("vtsls", config)
vim.lsp.enable("vtsls")
