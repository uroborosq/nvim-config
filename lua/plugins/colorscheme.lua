local colorscheme_file = vim.fn.stdpath("state") .. "/colorscheme"

local theme = ""

local function save_colorscheme(name)
	if name == "" then
		return
	end

	theme = name
	vim.notify("saving theme " .. theme)
	local file = io.open(colorscheme_file, "w")
	if file then
		file:write(name)
		file:close()
	end
end

local function load_colorscheme()
	local file = io.open(colorscheme_file, "r")
	if file then
		local name = file:read("*l")
		file:close()
		theme = name
		if name and name ~= "" then
			pcall(vim.cmd, "colorscheme " .. name)
		end
	end
end

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		load_colorscheme()
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function(args)
		save_colorscheme(args.match)
	end,
})

vim.keymap.set({ "n" }, "<leader>ub", function()
	if vim.o.background == "light" then
		vim.o.background = "dark"
	else
		vim.o.background = "light"
	end
end, { silent = true })

return {
	{
		"romgrk/doom-one.vim",
	},
	{
		"arizzoni/wal.nvim",
		config = function()
			vim.g.wal_path = os.getenv("HOME") .. "/.cache/wal/colors.json"
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		opts = {},
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,
		opts = {
			italics = true,
		},
		config = function(_, opts)
			require("everforest").setup(opts)
		end,
	},
	{
		"Mofiqul/vscode.nvim",
		opts = {},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			integrations = {
				markview = true,
				barbar = false,
				blink_cmp = {
					style = "bordered",
				},
			},
		},
	},
	{
		"ribru17/bamboo.nvim",
		opts = {},
	},
	{
		"rebelot/kanagawa.nvim",
		opts = {
			compile = true, -- enable compiling the colorscheme
			typeStyle = { bold = true },
		},
	},
	{ "xiantang/darcula-dark.nvim" },
	{
		"EdenEast/nightfox.nvim",
		opts = {
			options = {
				styles = {
					comments = "italic",
					keywords = "bold",
					types = "bold",
					functions = "bold",
					conditionals = "bold",
					constants = "bold,underline",
					numbers = "italic",
					strings = "italic",
					variables = "",
					operators = "",
					preprocs = "",
				},
			},
		},
	},
}
