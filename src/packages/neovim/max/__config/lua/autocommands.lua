-- src/packages/neovim/max/__config/lua/autocommands.lua
vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("DisableNewLineAutoCommentString", {}),
	callback = function()
		vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local fzf = require("fzf-lua")
		local bufnr = event.buf
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		vim.cmd.setlocal("signcolumn=yes")
		vim.bo[bufnr].bufhidden = "hide"

		local function desc(description)
			return { noremap = true, silent = true, buffer = bufnr, desc = "LSP: " .. description }
		end
		-- Keybinds
		-- Definition
		vim.keymap.set("n", "<leader>gd,", fzf.lsp_definitions, desc("[G]o to [D]efinition"))
		-- Type definition
		vim.keymap.set("n", "<leader>gtd", fzf.lsp_typedefs, desc("[G]o to [T]ype [D]efinition"))
		-- Declaration
		vim.keymap.set("n", "<leader>gD", fzf.lsp_declarations, desc("[G]o to [D]eclarations"))
		-- Code actions
		vim.keymap.set("n", "<leader>gca", fzf.lsp_code_actions, desc("[G]o to [C]ode [A]ction"))
		-- References
		vim.keymap.set("n", "<leader>gr", fzf.lsp_references, desc("[G]o to [R]eferences"))
		-- Implementation
		vim.keymap.set("n", "<leader>gi", fzf.lsp_implementations, desc("[G]o to [I]mplementations"))
		-- Diagnostics
		vim.keymap.set("n", "<leader>q", fzf.diagnostics_document, desc("Go to Diagnostics"))
		-- Finder
		vim.keymap.set("n", "<leader>gf", fzf.lsp_finder, desc("[G]o to [F]inder"))
		-- Rename
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, desc("[R]e[N]ame"))
	end,
})
