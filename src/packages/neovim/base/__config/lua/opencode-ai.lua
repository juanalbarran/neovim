-- src/packages/neovim/base/__config/lua/opencode.lua
local opencode = require("opencode")

opencode.setup({
	-- The default adapter/model to use.
	-- Can be "anthropic", "openai", "gemini", etc. depending on your OpenCode CLI setup.
	adapter = "anthropic",

	-- UI Customization
	ui = {
		-- Width of the chat window (percentage 0.0 - 1.0)
		width = 0.4,
		-- Show/hide the border
		border = "rounded",
	},

	-- Keybindings for the Chat Window
	keymaps = {
		-- General Neovim mappings (Normal mode outside chat)
		editor = {
			toggle = "<leader>ac", -- Toggle the AI Chat window
			new_chat = "<leader>an", -- Start a fresh chat
			add_selection = "<leader>as", -- Add current visual selection to context
		},

		-- Mappings inside the Input Window (where you type prompts)
		input_window = {
			submit = "<CR>", -- Press Enter to send
			new_line = "<S-CR>", -- Shift+Enter for new line
			close = "<Esc>", -- Close window
			cycle_model = "<M-m>", -- Alt+m to switch AI models
		},

		-- Mappings inside the Output Window (the AI response)
		output_window = {
			copy_code = "yi", -- Yank/Copy the code block under cursor
			apply_diff = "gd", -- Apply the code block as a diff to your file
			close = "<Esc>", -- Close window
		},
	},
})

-- Optional: Set up a statusline indicator (if using lualine)
-- You can add this component to your lualine.lua later if you want:
require("opencode.status").status()
