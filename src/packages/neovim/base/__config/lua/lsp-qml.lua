-- src/packages/neovim/base/__config/lua/lsp-qml.lua
local blink = require("blink.cmp")

local capabilities = {}
capabilities = vim.tbl_extend("keep", capabilities, blink.get_lsp_capabilities())

vim.lsp.config("qmlls", {
	capabilities = capabilities,
	cmd = { "qmlls" },
	filetypes = { "qml", "qmljs" },
	root_dir = function(fname)
		-- 1. Guard: Ensure fname is actually a string (fixes the "got number" error)
		if type(fname) ~= "string" then
			return nil
		end

		-- 2. Guard: Skip special buffers like oil:// or fugitive://
		if vim.startswith(fname, "oil://") or vim.startswith(fname, "fugitive://") then
			return nil
		end

		-- 3. Safely find the root
		local found = vim.fs.find({ "qmldir", ".git" }, { path = fname, upward = true })[1]
		if found then
			return vim.fs.dirname(found)
		end

		return nil
	end,
	single_file_support = true,
})

vim.lsp.enable("qmlls")
