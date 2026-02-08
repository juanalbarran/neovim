-- src/packages/neovim/base/__config/lua/lsp-css.lua
local blink = require("blink-cmp")
local capabilities = blink.get_lsp_capabilities()

-- Enable snippet support (cssls requires this explicitly sometimes)
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "css", "scss", "less" }, -- Added scss and less support
	callback = function(args)
		vim.lsp.start({
			name = "cssls",
			cmd = { "vscode-css-language-server", "--stdio" },

			root_dir = vim.fs.root(args.buf, { ".git", "package.json" }),

			capabilities = capabilities,

			settings = {
				css = { validate = true },
				scss = { validate = true },
				less = { validate = true },
			},
		})
	end,
})
