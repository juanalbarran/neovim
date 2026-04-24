-- src/packages/neovim/java/__config/lua/lsp-java.lua
local blink = require("blink.cmp")

local capabilities = blink.get_lsp_capabilities()

vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function()
		-- 1. Find the root of the Java project
		local root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }) or vim.fn.getcwd()

		-- 2. Generate a unique workspace directory name
		local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
		local workspace_dir = vim.fn.expand("~/.cache/nvim/jdtls-workspaces/") .. project_name

		-- 3. Start the LSP natively
		vim.lsp.start({
			name = "jdtls",
			cmd = { "jdtls", "-data", workspace_dir },
			root_dir = root_dir,
			capabilities = capabilities,

			-- ADDED: Tell JDTLS how to behave and manage the project
			settings = {
				java = {
					configuration = {
						-- Forces JDTLS to read pom.xml/build.gradle and load Mockito/Lombok dependencies
						updateBuildConfiguration = "automatic",
					},
					eclipse = {
						downloadSources = true,
					},
					maven = {
						downloadSources = true,
					},
					referencesCodeLens = {
						enabled = true,
					},
					signatureHelp = {
						enabled = true,
					},
					-- If you ever work on non-Maven/Gradle projects, you can point to standard lib folders here:
					-- project = {
					-- 	referencedLibraries = { "lib/**/*.jar" }
					-- }
				},
			},
			-- ADDED: Extended capabilities often required by JDTLS for full functionality
			init_options = {
				extendedClientCapabilities = {
					progressReportProvider = true,
					classFileContentsSupport = true,
					generateToStringPromptSupport = true,
					hashCodeEqualsPromptSupport = true,
					advancedFindEverywhereSupport = true,
					advancedOrganizeImportsSupport = true,
					generateConstructorsPromptSupport = true,
					generateDelegateMethodsPromptSupport = true,
				},
			},
		})
	end,
})
