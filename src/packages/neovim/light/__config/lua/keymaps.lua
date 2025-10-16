-- src/packages/neovim/light/__config/lua/keymaps.lua
local opts = { noremap = true, silent = true }

-- Mapleader
vim.g.mapleader = " "
vim.g.maplocaleader = " "

-- Insert mode out
vim.keymap.set("i", "jk", "<Esc>", opts, { desc = "Go back to normal mode." })
vim.keymap.set("i", "jj", "<Esc>", opts, { desc = "Go back to normal mode." })

-- Vital thing for configuration
vim.keymap.set("n", "-", "<cmd>Oil<CR>", opts, { desc = "File Explorer." })

-- Clear Highlights when pressing Esc in a search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostics
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts, { desc = "Open diagnostic [Q]uickfix." })

-- Split windows
vim.keymap.set("n", "<leader>vs", "<cmd>vsplit<CR>", opts, { desc = "[V]ertical [S]plit." })
vim.keymap.set("n", "<leader>hs", "<cmd>split<CR>", opts, { desc = "[H]orizontal [S]plit." })
vim.keymap.set("n", "<c-l>", "<c-w><c-l>", opts)
vim.keymap.set("n", "<c-h>", "<c-w><c-h>", opts)
vim.keymap.set("n", "<c-j>", "<c-w><c-j>", opts)
vim.keymap.set("n", "<c-k>", "<c-w><c-k>", opts)

-- Fzf-lua
vim.keymap.set("n", "<leader>cs", "<cmd>FzfLua colorschemes<CR>", opts, { desc = "Find [C]olor[S]chemes." })
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>", opts, { desc = "[F]ind [F]iles." })
vim.keymap.set("n", "<leader>b", "<cmd>FzfLua buffers<CR>", opts, { desc = "Find [B]uffers." })
vim.keymap.set("n", "<leader>fk", "<cmd>FzfLua keymaps<CR>", opts, { desc = "[F]ind [K]eymaps." })
vim.keymap.set("n", "<leader>fr", "<cmd>FzfLua resume<CR>", opts, { desc = "[F]ind [R]esume of the previous files." })
vim.keymap.set("n", "<leader>fw", "<cmd>FzfLua grep_cword<CR>", opts, { desc = "[F]ind current [W]ord." })
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>", opts, { desc = "[F]ind by [G]rep." })
vim.keymap.set(
	"n",
	"<leader>fnf",
	"<cmd>lua FzfLua.files({ cwd = vim.fn.stdpath('config') })<CR>",
	opts,
	{ desc = "[F]ind [N]eovim [F]iles." }
)
-- Buffer moves
vim.keymap.set("n", "<leader>n", ":bnext<CR>", { desc = "[N]ext Buffer." })
vim.keymap.set("n", "<leader>p", ":bprevious<CR>", { desc = "[P]revious Buffer." })

-- Dark / Light mode switch
vim.keymap.set("n", "<leader>tbg", function()
	if vim.o.background == "dark" then
		vim.o.background = "light"
	else
		vim.o.background = "dark"
	end
end, opts, { desc = "Shows Background" })
