-- src/packages/neovim/max/__config/lua/autocommands.lua
vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("DisableNewLineAutoCommentString", {}),
	callback = function()
		vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local bufnr = event.buf
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		vim.cmd.setlocal("signcolumn=yes")
		vim.bo[bufnr].bufhidden = "hide"

		local function desc(description)
			return { noremap = true, silent = true, buffer = bufnr, desc = "LSP: " .. description }
		end
		-- Keybinds
		-- Peek definition
		vim.keymap.set("n", "<leader>gpd,", "<cmd>Lspsaga peek_definition<CR>", desc("[G]o to [P]eek [D]efinition"))
		-- Peek type definition
		vim.keymap.set(
			"n",
			"<leader>gptd",
			"<cmd>Lspsaga peek_type_definition<CR>",
			desc("[G]o to [P]eek [T]ype [D]efinition")
		)
		-- Code actions
		vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc("[G]o to [C]ode [A]ction"))
		-- References
		vim.keymap.set("n", "<leader>gr", "<cmd>Lspsaga finder ref<CR>", desc("[G]o to [R]eferences"))
	end,
})
