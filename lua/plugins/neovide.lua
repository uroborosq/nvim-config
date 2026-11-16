if vim.g.neovide then
	-- local font = "ComicShannsMono Nerd Font,Monofur Nerd Font:#e-subpixelantialias"
	local font = "Mononoki Nerd Font:#e-subpixelantialias"
	local size = 12
	vim.o.guifont = font .. ":h" .. tostring(size)

	-- Animationen (Werte = Neovide-Standard, sofern nicht anders vermerkt)
	-- Fenster: Dauer der Positionsanimation (Verschieben/Größe ändern), in Sekunden
	vim.g.neovide_position_animation_length = 0.15
	-- Scrollen: Dauer der Animation und max. Zeilen, die bei weiten Sprüngen animiert werden
	vim.g.neovide_scroll_animation_length = 0.05
	vim.g.neovide_scroll_animation_far_lines = 1

	-- Fortschrittsbalken (LSP-Progress)
	vim.g.neovide_progress_bar_enabled = true
	vim.g.neovide_progress_bar_height = 5.0
	vim.g.neovide_progress_bar_animation_speed = 200.0
	vim.g.neovide_progress_bar_hide_delay = 0.2

	-- Cursor: Animationsdauer (Standard 0.150 bzw. 0.04 für kurze Sprünge) – hier abgeschaltet
	vim.g.neovide_cursor_animation_length = 0
	vim.g.neovide_cursor_short_animation_length = 0.0
	vim.g.neovide_cursor_trail_size = 1.0
	vim.g.neovide_cursor_animate_in_insert_mode = true
	vim.g.neovide_cursor_animate_command_line = true
	vim.g.neovide_cursor_smooth_blink = false

	-- Cursor-Partikeleffekte: "" (aus), "railgun", "torpedo", "pixiedust", "sonicboom", "ripple", "wireframe"
	vim.g.neovide_cursor_vfx_mode = ""
	vim.g.neovide_cursor_vfx_opacity = 200.0
	vim.g.neovide_cursor_vfx_particle_lifetime = 0.5
	vim.g.neovide_cursor_vfx_particle_highlight_lifetime = 0.2
	vim.g.neovide_cursor_vfx_particle_density = 0.7
	vim.g.neovide_cursor_vfx_particle_speed = 10.0
	vim.g.neovide_cursor_vfx_particle_phase = 1.5 -- nur railgun
	vim.g.neovide_cursor_vfx_particle_curl = 1.0 -- nur railgun

	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_window_blurred = true

	if os.getenv("XDG_CURRENT_DESKTOP") == "sway" then
		vim.g.neovide_opacity = 0.85
	end

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

	-- Deckkraft zwischen voll (1.0) und durchscheinend (0.85) umschalten
	vim.keymap.set("n", "<C-S-o>", function()
		if (vim.g.neovide_opacity or 1.0) < 1.0 then
			vim.g.neovide_opacity = 1.0
		else
			vim.g.neovide_opacity = 0.85
		end
	end, { desc = "Neovide-Deckkraft umschalten" })

	-- Profiler (FPS und Frame-Zeiten) ein-/ausblenden
	vim.keymap.set("n", "<leader>up", function()
		vim.g.neovide_profiler = not vim.g.neovide_profiler
	end, { desc = "Neovide-Profiler umschalten" })

	vim.opt.linespace = 3

	-- Unter sway mit gebrochener Skalierung (1.25) kommt das erste Resize mit einem Raster an,
	-- das ohne Skalierung berechnet wurde (212x47 statt 169x38). Erneutes Setzen von guifont
	-- zwingt Neovide, das Raster für die tatsächliche Fenstergröße neu zu berechnen.
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
