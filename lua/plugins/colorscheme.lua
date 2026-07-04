local colorscheme_file = vim.fn.stdpath("state") .. "/colorscheme"
local transparent_file = vim.fn.stdpath("state") .. "/transparent"

local transparent = false

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

local function load_transparency()
	local file = io.open(transparent_file, "r")
	if file then
		local enabled = file:read("*l")
		file:close()
		transparent = (enabled == "true")
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

vim.keymap.set({ "n" }, "<leader>ut", function()
	if transparent == true then
		transparent = false
	else
		transparent = true
	end

	local file = io.open(transparent_file, "w")
	if file then
		vim.notify("transparence for theme " .. theme .. ": " .. tostring(transparent))
		file:write(tostring(transparent))
		file:close()
	end

	-- reload colorscheme
	package.loaded[theme] = nil

	vim.cmd("colorscheme " .. theme)
end, { silent = true })

load_transparency()

return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		opts = {
			transparent_mode = transparent,
		},
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,
		opts = {
			transparent_background_level = transparent and 2 or 0,
			italics = true,
		},
		config = function(_, opts)
			require("everforest").setup(opts)
		end,
	},
	{ "Mofiqul/vscode.nvim", opts = {
		transparent = transparent,
	} },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		-- init = function()
		-- 	transparent = false
		-- end,
		opts = {
			transparent_background = transparent, -- disables setting the background color.
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
		opts = {
			transparent = transparent, -- Show/hide background
		},
	},
	{
		"rebelot/kanagawa.nvim",
		opts = {
			transparent = transparent, -- do not set background color
			compile = true, -- enable compiling the colorscheme
			typeStyle = { bold = true },
		},
	},
	{ "xiantang/darcula-dark.nvim" },
	{
		"EdenEast/nightfox.nvim",
		opts = {
			options = {
				transparent = transparent, -- Disable setting background
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
