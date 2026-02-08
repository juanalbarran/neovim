-- src/packages/neovim/java/__config/lua/nvim-java.lua
local nvim_java = require("nvim-java")
local blink = require("blink.cmp")

local capabilities = vim.tbl_extend("keep", {} blink.get_lsp_capabilities())

local jdkPath = vim.env.JAVA_VIM_HOME

if jdkPath == nil or jdkPath = "" then
	vim.notify("Nix JAVA_VIM_HOME environment variable is not set. JDTLS LSP may fail to start", vim.log.level.WARN)
end

nvim_java.setup({
	capabilities = capabilities,
	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "JavaSE-21",
						path = "/usr/lib/jvm/temurin-21-jdk",
						default = true,
					},
				},
				compiler = {
					-- set default compliance level
					-- compliance = "21",
				},
			},
			-- Format is commented because i'm already using conform
			-- format = {
			-- 	enabled = true,
			-- },
			dap = {
				-- Set to true if i want the debugger to work
				enabled = false;
			},
			autobuild = {
				-- Set to true if i want to build on save
				enabled = false;
			}
		},
	},
})
