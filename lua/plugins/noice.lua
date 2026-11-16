-- Neovide (>= 0.17) hängt sich beim Start vorübergehend mit ext_cmdline/ext_messages an,
-- um Startmeldungen bis zum ersten Rendern abzufangen (--startup-message-capture).
-- Läuft noice.setup() in diesem Zeitfenster, hält noice die Cmdline und Meldungen für
-- von der GUI externalisiert und schaltet die eigenen Handler dafür ab.
local function gui_ext_active()
	for _, ui in ipairs(vim.api.nvim_list_uis()) do
		if ui.ext_cmdline or ui.ext_messages then
			return true
		end
	end
	return false
end

return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	config = function(_, opts)
		if not (vim.g.neovide and gui_ext_active()) then
			require("noice").setup(opts)
			return
		end
		-- Warten, bis Neovide die Erweiterungen wieder abschaltet (höchstens 3 s)
		local timer = assert(vim.uv.new_timer())
		local started = vim.uv.now()
		timer:start(
			20,
			20,
			vim.schedule_wrap(function()
				if timer:is_closing() then
					return
				end
				if gui_ext_active() and vim.uv.now() - started < 3000 then
					return
				end
				timer:close()
				require("noice").setup(opts)
			end)
		)
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}
