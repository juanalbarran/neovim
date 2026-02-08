-- src/packages/neovim/web/__config/lua/conform.lua
local conform = require("conform")
conform.formatters_by_ft = {
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	nix = { "alejandra", "nixfmt" },
}
