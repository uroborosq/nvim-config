local prefix = "<leader>t"
return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		keys = {
			{
				prefix .. "t",
				function()
					require("neotest").run.run()
				end,
				desc = "Nächstgelegenen Test ausführen",
			},
			{
				prefix .. "f",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Alle Tests der Datei ausführen",
			},
			{
				prefix .. "d",
				function()
					require("neotest").run.run({ strategy = "dap" })
				end,
				desc = "Nächstgelegenen Test debuggen",
			},
			{
				prefix .. "h",
				function()
					require("neotest").output.open()
				end,
				desc = "Testausgabe anzeigen",
			},
			{
				prefix .. "o",
				function()
					require("neotest").output_panel.open()
				end,
				desc = "Ausgabefenster öffnen",
			},
			{
				"]t",
				function()
					require("neotest").jump.next()
				end,
				desc = "Nächster Test",
			},
			{
				"[t",
				function()
					require("neotest").jump.prev()
				end,
				desc = "Vorheriger Test",
			},
			{
				prefix .. "<CR>",
				function()
					require("neotest").summary.toggle()
				end,
				desc = "Testübersicht umschalten",
			},
		},
		opts = {
			discovery = {
				enabled = false,
			},
			output = {
				open_on_run = false,
			},
		},
		config = function(_, opts)
			require("neotest").setup(opts)
		end,
	},
	{
		"andythigpen/nvim-coverage",
		keys = {
			{
				prefix .. "c" .. "t",
				function()
					require("coverage").toggle()
				end,
				desc = "Abdeckungszeichen umschalten",
			},
			{
				prefix .. "c" .. "s",
				function()
					require("coverage").summary()
				end,
				desc = "Abdeckungsübersicht anzeigen",
			},
			{
				prefix .. "c" .. "c",
				function()
					require("coverage").clear()
				end,
				desc = "Abdeckungszeichen entfernen",
			},
			{
				prefix .. "c" .. "l",
				function()
					require("coverage").load(true)
				end,
				desc = "Abdeckung laden und anzeigen",
			},
		},
		opts = {
			auto_reload = true,
		},
	},
}
