-- src/packages/neovim/max/__config/lua/lsp-vtsls.lua
local baseConfig = require("vtsls").lspconfig
local customConfig = {
	typescript = {
		preferences = {
			autoImportSpecifierExcludeRegexes = { "@mui\\/system" },
		},
		inlayHints = {
			parameterNames = { enabled = "all" },
			parameterTypes = { enabled = true },
			variableTypes = { enabled = true },
			propertyDeclarationTypes = { enabled = true },
			functionLikeReturnTypes = { enabled = true },
			enumMemberValues = { enabled = true },
		},
	},
}
local config = vim.tbl_deep_extend("force", baseConfig, customConfig)

vim.lsp.config("vtsls", config)
vim.lsp.enable("vtsls")
