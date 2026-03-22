-- src/packages/neovim/rust/__config/lua/crates.lua
require('crates').setup({
  lsp = {
    enabled = true,
    actions = true,
    completion = true,
    hover = true,
  },
})
