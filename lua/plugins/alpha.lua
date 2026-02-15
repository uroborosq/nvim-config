return {
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "nvim-mini/mini.icons" },
		config = function()
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = [[

███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

                   Talk is cheap. Show me the code
                                  - Linus Torvalds
          ]]
			dashboard.section.header.opts.hl = ""
			dashboard.section.footer.opts.hl = ""

			local function center_pad()
				local lines = vim.fn.winheight(0)
				local header_lines = #vim.split(dashboard.section.header.val, "\n")
				return math.floor((lines - header_lines) / 4)
			end

			dashboard.config.layout = {
				{
					type = "padding",
					val = center_pad(),
				},
				dashboard.section.header,
				{
					type = "padding",
					val = 2 * center_pad(),
				},
				{
					type = "padding",
					val = center_pad(),
				},
				dashboard.section.footer,
			}
			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyVimStarted", -- для lazy.nvim
				callback = function()
					local stats = require("lazy").stats()

					local plugins = stats.count
					local time = (math.floor(stats.startuptime * 100) / 100)

					dashboard.section.footer.val = "⚡ Loaded " .. plugins .. " plugins in " .. time .. " ms"

					pcall(vim.cmd.AlphaRedraw)
				end,
			})
			require("alpha").setup(dashboard.config)
		end,
	},
}
