local colorscheme_file = vim.fn.stdpath("state") .. "/colorscheme"

local function save_colorscheme(name)
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

return {
	{ "ellisonleao/gruvbox.nvim", priority = 1000 },
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,
	},
	{ "Mofiqul/vscode.nvim" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			integrations = {
				markview = true,
				barbar = true,
				blink_cmp = {
					style = "bordered",
				},
			},
		},
	},
	{ "ribru17/bamboo.nvim" },
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
