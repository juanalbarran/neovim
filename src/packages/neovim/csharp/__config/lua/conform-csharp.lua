-- src/packages/neovim/csharp/__config/lua/conform-csharp.lua
local conform = require("conform")

conform.formatters_by_ft = conform.formatters_by_ft or {}
conform.formatters_by_ft.cs = { "csharpier" }
