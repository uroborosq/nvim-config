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

	local function resize_font(delta)
		size = size + delta
		vim.o.guifont = font .. ":h" .. tostring(size)
	end

	-- Alt+- / Alt++ in allen Modi; Alt+= für + ohne Shift
	local modes = { "n", "i", "v", "t" }
	vim.keymap.set(modes, "<A-->", function()
		resize_font(-1)
	end, { desc = "Schrift verkleinern" })
	vim.keymap.set(modes, "<A-+>", function()
		resize_font(1)
	end, { desc = "Schrift vergrößern" })
	vim.keymap.set(modes, "<A-=>", function()
		resize_font(1)
	end, { desc = "Schrift vergrößern" })

	-- Neovide verarbeitet Ctrl+Shift+V nicht selbst (anders als ein Terminalemulator):
	-- Zwischenablage per nvim_paste an den Job senden (mit Bracketed Paste)
	vim.keymap.set("t", "<C-S-v>", function()
		vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
	end, { desc = "Aus Systemzwischenablage einfügen" })

	vim.opt.linespace = 3

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
