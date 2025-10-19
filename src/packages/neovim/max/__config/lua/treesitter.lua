-- src/packages/neovim/max/__config/lua/treesitter.lua
require("nvim-treesitter.configs").setup({
  auto_install = false,
  sync_install = false,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  ensure_installed = {},
})

vim.api.nvim_set_option("foldenable", true)
