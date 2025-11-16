local wk = require("which-key")

wk.setup({
	preset = "helix",
})
wk.add({
	{ "<leader>f", group = "[F]iles:" },
	{ "<leaser>g", group = "LSP:" },
	{ "<leader>b", group = "[B]uffers:" },
})
