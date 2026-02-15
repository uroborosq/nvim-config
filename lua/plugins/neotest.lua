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
				desc = "Run neartest test",
			},
			{
				prefix .. "f",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Run all file",
			},
			{
				prefix .. "d",
				function()
					require("neotest").run.run({ strategy = "dap" })
				end,
				desc = "Debug nearest test",
			},
			{
				prefix .. "h",
				function()
					require("neotest").output.open()
				end,
				desc = "Hover test output",
			},
			{
				prefix .. "o",
				function()
					require("neotest").output_panel.open()
				end,
				desc = "Open output window",
			},
			{
				"]t",
				function()
					require("neotest").jump.next()
				end,
				desc = "Next test",
			},
			{
				"[t",
				function()
					require("neotest").jump.prev()
				end,
				desc = "Previous test",
			},
			{
				prefix .. "<CR>",
				function()
					require("neotest").summary.toggle()
				end,
				desc = "Toggle summary window",
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
				desc = "Toggle coverage signs",
			},
			{
				prefix .. "c" .. "s",
				function()
					require("coverage").summary()
				end,
				desc = "Show coverage summary",
			},
			{
				prefix .. "c" .. "c",
				function()
					require("coverage").clear()
				end,
				desc = "Clear coverage signs",
			},
			{
				prefix .. "l",
				function()
					require("coverage").load(true)
				end,
				desc = "Show and load coverage",
			},
		},
		opts = {
			auto_reload = true,
		},
	},
}
