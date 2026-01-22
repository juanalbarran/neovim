-- src/packages/neovim/base/__config/lua/opencode-ai.lua
local M = {}

-- Configuration for the floating window
local config = {
	width = 0.5, -- 50% width
	height = 0.6, -- 60% height
	border = "rounded",
}

local state = {
	buf = -1,
	win = -1,
}

local function create_window()
	-- 1. Calculate dimensions
	local uis = vim.api.nvim_list_uis()[1]
	local width = math.floor(uis.width * config.width)
	local height = math.floor(uis.height * config.height)
	local col = math.floor((uis.width - width) / 2)
	local row = math.floor((uis.height - height) / 2)

	-- 2. Create a buffer if it doesn't exist or is invalid
	if not vim.api.nvim_buf_is_valid(state.buf) then
		state.buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
	end

	-- 3. Create the window
	state.win = vim.api.nvim_open_win(state.buf, true, {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal",
		border = config.border,
		title = " OpenCode AI ",
		title_pos = "center",
	})

	-- 4. Set buffer options (terminal mode specific)
	vim.bo[state.buf].filetype = "opencode"
	vim.bo[state.buf].bufhidden = "hide"
end

function M.toggle()
	if vim.api.nvim_win_is_valid(state.win) then
		-- If window is open, hide it
		vim.api.nvim_win_hide(state.win)
	else
		-- Create window
		create_window()

		-- If terminal isn't running in this buffer, start it
		if vim.bo[state.buf].channel == 0 then
			-- Use 'opencode' command. Ensure the CLI is in your dependencies!
			vim.fn.termopen("opencode", {
				on_exit = function()
					state.buf = -1 -- Reset buffer on exit
					if vim.api.nvim_win_is_valid(state.win) then
						vim.api.nvim_win_close(state.win, true)
					end
				end,
			})
		end

		-- Enter Insert mode immediately
		vim.cmd("startinsert")
	end
end

-- Create a user command :OpenCode
vim.api.nvim_create_user_command("OpenCode", M.toggle, {})

-- Keybinding: <leader>ac to toggle
vim.keymap.set({ "n", "t" }, "<leader>ac", M.toggle, { desc = "Toggle OpenCode AI" })

return M
