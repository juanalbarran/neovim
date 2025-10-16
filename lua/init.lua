-- luaConfig/init.lua
require("options")
require("keymaps")
require("autocommands")
require("lsp")

require("plugins.treesitter")

-- files
require("plugins.oil")
require("plugins.fzf-lua")

-- editing
require("nvim-autopairs").setup()
require("tabout").setup()

-- ui
require("plugins.lualine")
require("noice").setup()

-- utils
require("plugins.which-key")
require("colorizer").setup()

-- format
require("plugins.conform")

-- autocomplete
require("plugins.blink-cmp")

vim.cmd.colorscheme("zenbones")
