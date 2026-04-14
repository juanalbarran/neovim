-- src/packages/neovim/java/__config/lua/conform-java.lua
local conform = require("conform")

-- Extend the existing table instead of overwriting it
conform.formatters_by_ft = conform.formatters_by_ft or {}
conform.formatters_by_ft.java = { "google-java-format" }
