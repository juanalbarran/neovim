require("conform").setup({
  formatted_by_ft = {
    lua = { "stylua" },
    nix = { "nil" },
  },
  format_on_save = {
    timeout_ms = 1000,
    lsp_format = "fallback",
  },
})
