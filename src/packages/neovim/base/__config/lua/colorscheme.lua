-- src/packages/neovim/base/__config/lua/colorscheme.lua
-- vim.cmd.colorscheme('zenbones')
-- vim.cmd.colorscheme("alabaster")
-- src/packages/neovim/base/__config/lua/colorscheme.lua

-- 1. CONFIGURATION
-- Point to the file managed by toggle-theme.sh
local theme_file_path = vim.fn.expand("$HOME/.cache/style/mode")
local uv = vim.uv or vim.loop -- Handles both new and old Neovim versions

-- !!! CHANGE THESE TO YOUR INSTALLED THEMES !!!
local DARK_THEME = "vague" --"tokyonight-moon" -- Example: "catppuccin", "vague", "gruvbox"
local LIGHT_THEME = "alabaster" -- "onedark" -- Example: "alabaster", "dayfox", "rose-pine-dawn"

-- 2. HELPER FUNCTIONS

local function read_file(path)
	local file = io.open(path, "r")
	if not file then
		return nil
	end
	local content = file:read("*line") -- Read first line ("dark" or "light")
	file:close()
	return content
end

local function apply_theme(mode)
	-- Clean the string (remove spaces/newlines)
	mode = mode and mode:gsub("%s+", "") or "dark"

	if mode == "light" then
		vim.api.nvim_set_option_value("background", "light", {})
		local ok, _ = pcall(vim.cmd.colorscheme, LIGHT_THEME)
		if not ok then
			print("Error loading light theme: " .. LIGHT_THEME)
		end
	else
		vim.api.nvim_set_option_value("background", "dark", {})
		local ok, _ = pcall(vim.cmd.colorscheme, DARK_THEME)
		if not ok then
			print("Error loading dark theme: " .. DARK_THEME)
		end
	end
end

-- 3. WATCHER LOGIC
local function watch_theme_change()
	local handle = uv.new_fs_event()

	local function unwatch()
		if handle then
			uv.fs_event_stop(handle)
		end
	end

	local function on_event(err, filename, events)
		if err then
			unwatch()
			return
		end

		-- Schedule UI updates on the main thread
		vim.schedule(function()
			local new_mode = read_file(theme_file_path)
			apply_theme(new_mode)

			-- Restart watcher to handle file replacements (inode changes)
			unwatch()
			watch_theme_change()
		end)
	end

	if handle then
		uv.fs_event_start(handle, theme_file_path, {}, on_event)
	end
end

-- 4. INITIALIZATION (Run once on startup)
local current_mode = read_file(theme_file_path)
apply_theme(current_mode)

-- Start the watcher
watch_theme_change()
