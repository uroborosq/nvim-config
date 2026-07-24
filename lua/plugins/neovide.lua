if vim.g.neovide then
	local font = "ComicShannsMono Nerd Font,Monofur Nerd Font:#e-subpixelantialias"
	local size = 11
	vim.o.guifont = font .. ":h" .. tostring(size)

	vim.g.neovide_cursor_animation_length = 0
	vim.g.neovide_cursor_short_animation_length = 0.0

	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_window_blurred = true
	vim.g.neovide_opacity = 0.9

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
