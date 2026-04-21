-- src/packages/neovim/java/__config/lua/java-creator.lua
local java_creator = require("java-creator-nvim")
java_creator.setup({
	options = {
		java_version = 21,
		auto_open = true,
	},
})
