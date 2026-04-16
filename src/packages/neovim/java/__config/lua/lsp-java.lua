-- src/packages/neovim/java/__config/lua/lsp-java.lua
local blink = require("blink.cmp")

local capabilities = blink.get_lsp_capabilities()

vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function()
		-- 1. Find the root of the Java project (where pom.xml or build.gradle lives)
		local root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }) or vim.fn.getcwd()

		-- 2. Generate a unique workspace directory name in your cache folder
		local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
		local workspace_dir = vim.fn.expand("~/.cache/nvim/jdtls-workspaces/") .. project_name

		-- 3. Start the LSP natively
		vim.lsp.start({
			name = "jdtls",
			-- The `jdtls` command is provided directly by your Nix _dependencies.nix
			cmd = { "jdtls", "-data", workspace_dir },
			root_dir = root_dir,
			capabilities = capabilities,
		})
	end,
})
