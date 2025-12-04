-- src/packages/neovim/max/__config/lua/lsp-jdtls.lua
local baseConfig = require("jdtls").lspconfig
local config = vim.tbl_deep_extend("force", baseConfig)

vim.lsp.config("jdtls", config)
vim.lsp.enable("jdtls")
