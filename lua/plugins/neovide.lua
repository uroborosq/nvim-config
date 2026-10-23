if vim.g.neovide then
	-- local font = "ComicShannsMono Nerd Font,Monofur Nerd Font:#e-subpixelantialias"
	local font = "Mononoki Nerd Font:#e-subpixelantialias"
	local size = 12
	vim.o.guifont = font .. ":h" .. tostring(size)

	vim.g.neovide_cursor_animation_length = 0
	vim.g.neovide_cursor_short_animation_length = 0.0

	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_window_blurred = true

	-- if os.getenv("XDG_CURRENT_DESKTOP") == "sway" then
	-- 	vim.g.neovide_opacity = 0.9
	-- end

	vim.keymap.set("n", "<C-->", function()
		size = size - 1
		vim.o.guifont = font .. ":h" .. tostring(size)
	end, { desc = "Schrift verkleinern" })

	-- увеличить
	vim.keymap.set("n", "<C-+>", function()
		size = size + 1
		vim.o.guifont = font .. ":h" .. tostring(size)
	end, { desc = "Schrift vergrößern" })

	vim.opt.linespace = 3

	-- На sway с дробным масштабом (1.25) первый resize приходит с сеткой,
	-- посчитанной без учёта масштаба (212x47 вместо 169x38). Повторная установка
	-- guifont заставляет neovide пересчитать сетку под реальный размер окна.
	vim.api.nvim_create_autocmd("VimResized", {
		once = true,
		callback = function()
			vim.defer_fn(function()
				vim.o.guifont = vim.o.guifont
			end, 100)
		end,
	})
end

return {}
