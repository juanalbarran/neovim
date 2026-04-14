-- src/packages/neovim/rust/__config/lua/conform-rust.lua
local conform = require("conform")
conform.formatters_by_ft = conform.formatters_by_ft or {}
conform.formatters_by_ft.rust = { "rustfmt" }
