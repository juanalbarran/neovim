-- src/packages/neovim/rust/__config/lua/conform-rust.lua
require("conform").setup({
  formatters_by_ft = {
    rust = { "rustfmt" },
  },
})
