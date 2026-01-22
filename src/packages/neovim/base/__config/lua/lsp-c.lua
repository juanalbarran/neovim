-- src/packages/neovim/base/__config/lua/lsp-c.lua
local c_filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" }

vim.api.nvim_create_autocmd("FileType", {
	pattern = c_filetypes,
	callback = function(ev)
		local root_file = vim.fs.find({
			".git",
			"compile_commands.json",
			"compile_flags.txt",
			".clang-format",
		}, { upward = true, path = vim.fs.dirname(ev.file) })[1]

		local client_root = root_file and vim.fs.dirname(root_file) or vim.uv.cwd()

		vim.lsp.start({
			name = "clangd",
			cmd = {
				"clangd",
				"--background-index",
				"--clang-tidy",
				"--header-insertion=iwyu",
				"--completion-style=detailed",
				"--function-arg-placeholders",
				"--fallback-style=llvm",
			},
			root_dir = client_root,
			capabilities = require("blink.cmp").get_lsp_capabilities(),
		})
	end,
})
