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

			local function center_pad()
				local lines = vim.fn.winheight(0)
				local header_lines = #vim.split(dashboard.section.header.val, "\n")
				return math.floor((lines - header_lines) / 2)
			end

			dashboard.config.layout = {
				{
					type = "padding",
					val = center_pad(),
				},
				dashboard.section.header,
				{
					type = "padding",
					val = center_pad(),
				},
			}

			require("alpha").setup(dashboard.config)
		end,
	},
}
