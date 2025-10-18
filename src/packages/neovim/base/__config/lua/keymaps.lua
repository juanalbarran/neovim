-- src/packages/neovim/light/__config/lua/keymaps.lua
local opts = { noremap = true, silent = true }

-- Mapleader
vim.g.mapleader = " "
vim.g.maplocaleader = " "

-- Insert mode out
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true, desc = "Go back to normal mode." })
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true, desc = "Go back to normal mode." })

-- Important File Explorer
vim.keymap.set("n", "-", "<cmd>Oil<CR>", { noremap = true, silent = true, desc = "File Explorer." })

-- Clear Highlights when pressing Esc in a search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { noremap = true, silent = true, desc = "Clear Search Highlight" })

-- Diagnostics
vim.keymap.set(
	"n",
	"<leader>q",
	vim.diagnostic.open_float,
	{ noremap = true, silent = true, desc = "Open diagnostic [Q]uickfix." }
)

-- Split windows
vim.keymap.set("n", "<leader>vs", "<cmd>vsplit<CR>", { noremap = true, silent = true, desc = "[V]ertical [S]plit." })
vim.keymap.set("n", "<leader>hs", "<cmd>split<CR>", { noremap = true, silent = true, desc = "[H]orizontal [S]plit." })
vim.keymap.set("n", "<c-l>", "<c-w><c-l>", opts)
vim.keymap.set("n", "<c-h>", "<c-w><c-h>", opts)
vim.keymap.set("n", "<c-j>", "<c-w><c-j>", opts)
vim.keymap.set("n", "<c-k>", "<c-w><c-k>", opts)

-- Fzf-lua
vim.keymap.set(
	"n",
	"<leader>cs",
	"<cmd>FzfLua colorschemes<CR>",
	{ noremap = true, silent = true, desc = "Find [C]olor[S]chemes." }
)
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>", { noremap = true, silent = true, desc = "[F]ind [F]iles." })
vim.keymap.set("n", "<leader>b", "<cmd>FzfLua buffers<CR>", { noremap = true, silent = true, desc = "Find [B]uffers." })
vim.keymap.set(
	"n",
	"<leader>fk",
	"<cmd>FzfLua keymaps<CR>",
	{ noremap = true, silent = true, desc = "[F]ind [K]eymaps." }
)
vim.keymap.set(
	"n",
	"<leader>fr",
	"<cmd>FzfLua resume<CR>",
	{ noremap = true, silent = true, desc = "[F]ind [R]esume of the previous files." }
)
vim.keymap.set(
	"n",
	"<leader>fw",
	"<cmd>FzfLua grep_cword<CR>",
	{ noremap = true, silent = true, desc = "[F]ind current [W]ord." }
)
vim.keymap.set(
	"n",
	"<leader>fg",
	"<cmd>FzfLua live_grep<CR>",
	{ noremap = true, silent = true, desc = "[F]ind by [G]rep." }
)

-- Buffer moves
vim.keymap.set("n", "<leader>n", "<cdm>bnext<CR>", { noremap = true, silent = true, desc = "[N]ext Buffer." })
vim.keymap.set("n", "<leader>p", "<cmd>bprevious<CR>", { noremap = true, silent = true, desc = "[P]revious Buffer." })

-- Colorizer Toggle
vim.keymap.set(
	"n",
	"<leader>ct",
	"<cmd>ColorizerToggle<CR>",
	{ noremap = true, silent = true, desc = "[C]olorizer [T]oggle" }
)

-- LSP: Language Server Protocol
vim.keymap.set(
	"n",
	"<leader>gi",
	vim.lsp.buf.implementation,
	{ noremap = true, silent = true, desc = "LSP: [G]o to [I]mplementation" }
)
vim.keymap.set(
	"n",
	"<leader>ca",
	vim.lsp.buf.code_action,
	{ noremap = true, silent = true, desc = "LSP: [C]ode [A]ction" }
)
vim.keymap.set(
	"n",
	"<leader>gd",
	vim.lsp.buf.definition,
	{ noremap = true, silent = true, desc = "LSP: [G]o to [D]efinition" }
)
vim.keymap.set(
	"n",
	"<leader>gtd",
	vim.lsp.buf.type_definition,
	{ noremap = true, silent = true, desc = "LSP: [G]o to [T]ype [D]efinition" }
)
vim.keymap.set(
	"n",
	"<leader>gD",
	vim.lsp.buf.declaration,
	{ noremap = true, silent = true, desc = "LSP: [G]o to [D]eclaration" }
)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "LSP: [R]e[N]ame" })
