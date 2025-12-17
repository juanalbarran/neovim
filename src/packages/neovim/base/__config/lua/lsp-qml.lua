-- src/packages/neovim/base/__config/lua/lsp-qml.lua

local blink = require("blink-cmp")

local capabilities = {}
capabilities = vim.tbl_extend("keep", capabilities, blink.get_lsp_capabilities())

vim.lsp.config("qmlls", {
	capabilities = capabilities,
	cmd = { "qmlls" },
	filetypes = { "qml", "qmljs" },
	root_dir = function(fname)
		return vim.fs.dirname(vim.fs.find({ "qmldir", ".git" }, { path = fname, upward = true })[1])
	end,
	single_file_support = true,
})

vim.lsp.enable("qmlls")
