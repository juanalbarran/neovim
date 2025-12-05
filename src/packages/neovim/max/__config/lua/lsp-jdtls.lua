-- src/packages/neovim/max/__config/lua/lsp-jdtls.lua
local jdtls = require("jdtls")

-- 1. Find the 'jdtls' executable in your PATH (installed by Nix)
local jdtls_bin = vim.fn.exepath("jdtls")
if jdtls_bin == "" then
	vim.notify("jdtls not found. Is jdt-language-server installed?", vim.log.levels.ERROR)
	return
end

-- 2. Setup the workspace directory
-- jdtls needs a unique workspace directory for each project to store build data.
local home = os.getenv("HOME")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/.local/share/nvim/jdtls-workspace/" .. project_name

-- 3. Define the configuration
local config = {
	cmd = {
		jdtls_bin, -- The wrapper script from Nix
		"-data",
		workspace_dir, -- Tell it where to store project data
	},
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),

	-- Essential settings
	settings = {
		java = {
			errors = { incompleteClasspath = { severity = "ignore" } },
			configuration = {
				-- If you need specific runtimes (JDKs) for your projects:
				runtimes = {
					{
						name = "JavaSE-17",
						path = "/nix/store/...", -- WARNING: Hardcoding Nix paths is brittle
						-- Better approach: Use your shell's JAVA_HOME or rely on the wrapper's default
					},
				},
			},
		},
	},

	-- Attach mappings (example)
	on_attach = function(client, bufnr)
		-- Enable completion trigger
		jdtls.setup_dap({ hotcodereplace = "auto" })
		jdtls.setup.add_commands()

		-- Example keymap
		local opts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "<leader>co", jdtls.organize_imports, opts)
	end,
}

-- 4. Start the server
jdtls.start_or_attach(config)
