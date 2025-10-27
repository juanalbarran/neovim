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
		vim.keymap.set(
			"n",
			"<leader>gpd",
			"<cmd>LspSaga diagnostic_jump_prev<CR>",
			desc("[G]o to [P]revious [D]iagnostic")
		)
		vim.keymap.set("n", "<leader>gnd", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc("[G]o to [N]ext [D]iagnostic"))
		-- Finder
		vim.keymap.set("n", "<leader>gf", "<cmd>Lspsaga finder<CR>", desc("[G]o to [F]inder"))
		-- Rename
		vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", desc("[R]e[N]ame"))
		-- Hover
		vim.keymap.set("n", "<K>", "<cmd>Lspsaga hover_doc<CR>", desc("Hover"))

		-- The following two autocommands are used to highlight references of the
		-- word under your cursor when your cursor rests there for a little while.
		--    See `:help CursorHold` for information about when this is executed
		--
		-- When you move your cursor, the highlights will be cleared (the second autocommand).
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
				end,
			})
		end
	end,
})
