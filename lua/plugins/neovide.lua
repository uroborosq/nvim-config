if vim.g.neovide then
	local font = "Adwaita Mono:#e-subpixelantialias"
	local size = 11
	vim.o.guifont = font .. ":h" .. tostring(size)

	-- vim.g.neovide_cursor_vfx_mode = "railgun"
	-- vim.g.neovide_cursor_vfx_particle_density = 2
	-- vim.g.neovide_position_animation_length = 0.10
	vim.g.neovide_cursor_animation_length = 0.10
	vim.g.neovide_cursor_short_animation_length = 0.03
	vim.g.neovide_cursor_trail_size = 0.05
	vim.g.neovide_cursor_antialiasing = false
	vim.g.neovide_progress_bar_enabled = true
	vim.g.neovide_progress_bar_height = 5.0
	vim.g.neovide_progress_bar_animation_speed = 200.0
	vim.g.neovide_progress_bar_hide_delay = 0.2

	vim.g.neovide_hide_mouse_when_typing = true

	vim.keymap.set("n", "<C-->", function()
		size = size - 1
		vim.o.guifont = font .. ":h" .. tostring(size)
	end)

	-- увеличить
	vim.keymap.set("n", "<C-=>", function()
		size = size + 1
		vim.o.guifont = font .. ":h" .. tostring(size)
	end)

	vim.opt.linespace = 3
end

return {}
