-- src/packages/neovim/java/__config/lua/conform.lua
local conform = require("conform")
conform.formatters_by_ft = {
	java = { "google-java-format" },
}
