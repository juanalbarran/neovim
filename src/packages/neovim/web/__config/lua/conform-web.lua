-- src/packages/neovim/web/__config/lua/conform-web.lua
local conform = require("conform")
conform.formatters_by_ft = vim.tbl_extend("force", conform.formatters_by_ft or {}, {
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
})
