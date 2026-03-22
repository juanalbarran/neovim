-- src/packages/neovim/rust/__config/lua/lsp-rust.lua
-- Configure rustaceanvim (this replaces the need for lspconfig)
vim.g.rustaceanvim = {
  server = {
    default_settings = {
      ['rust-analyzer'] = {
        -- Use clippy on save for better linting
        checkOnSave = {
          command = "clippy",
        },
        -- Enable inlay hints natively
        inlayHints = {
          bindingModeHints = { enable = true },
          closureReturnTypeHints = { enable = "always" },
          lifetimeElisionHints = { enable = "always", useParameterNames = true },
        },
      },
    },
  },
}
