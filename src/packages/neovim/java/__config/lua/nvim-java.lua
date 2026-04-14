-- src/packages/neovim/java/__config/lua/nvim-java.lua
local nvim_java = require("java")
local blink = require("blink.cmp")

local capabilities = vim.tbl_extend("keep", {}, blink.get_lsp_capabilities())

local jdk_path = vim.env.JAVA_HOME or vim.fn.exepath("java"):gsub("/bin/java$", "")

nvim_java.setup({
	capabilities = capabilities,
	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "JavaSE-21",
						path = jdk_path,
						default = true,
					},
				},
				compiler = {},
			},
			dap = {
				enabled = false,
			},
			autobuild = {
				enabled = false,
			},
		},
	},
})
