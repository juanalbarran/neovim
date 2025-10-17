local wk  = require("which-key")
wk.setup({
  preset = "helix",
})
wk.add({
  { "<leader>f", group = "Files" },
  { "<leader>g", group = "LSP" },
})
