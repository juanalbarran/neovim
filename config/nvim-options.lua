-- line numbers
vim.o.number = true
vim.o.relativenumber = true

-- cursor line
vim.o.cursorline = true

-- clipboard
vim.schedule(function()
    vim.o.clipboard = "unnamedplus"
end)

-- indentation
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.autoindent = true
vim.o.breakindent = true

vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4

vim.o.undofile = true
vim.o.undodir = vim.fn.expand("~/.config/nvim/undodir")
