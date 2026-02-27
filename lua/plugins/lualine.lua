local function duration_to_de(s)
	if type(s) ~= "string" then
		return nil, "input must be a string"
	end

	-- Убираем лишние пробелы по краям и приводим к нижнему регистру
	s = s:lower():match("^%s*(.-)%s*$")

	-- Ищем часы и минуты (порядок не важен)
	-- Поддерживаем варианты: hr / hrs / hour / hours; min / mins / minute / minutes
	local h = s:match("(%d+)%s*h%w*") -- "1hr", "1 hrs", "1hour(s)"
	local m = s:match("(%d+)%s*m%w*") -- "32mins", "32 min", "32minute(s)"

	h = h and tonumber(h) or nil
	m = m and tonumber(m) or nil

	if not h and not m then
		return nil, "unrecognized format"
	end

	local parts = {}

	if h then
		if h == 1 then
			table.insert(parts, "1 Std.")
		else
			table.insert(parts, tostring(h) .. " Std.")
		end
	end

	if m then
		if m == 1 then
			table.insert(parts, "1 Min.")
		else
			table.insert(parts, tostring(m) .. " Min.")
		end
	end

	return table.concat(parts, " ")
end

local function wakastat()
	local time = require("wakastat").status()
	if time:find("WakaTime") then
		return ""
	end

	return duration_to_de(time)
end

local selectioncount = {
	function()
		local starts = vim.fn.line("v")
		local ends = vim.fn.line(".")
		local lines = starts <= ends and ends - starts + 1 or starts - ends + 1
		return " " .. tostring(lines) .. " lines " .. tostring(vim.fn.wordcount().visual_chars) .. " chars"
	end,
	cond = function()
		-- return true
		local m = vim.fn.mode()
		return m == "V" or m == "v"
	end,
}

local project = {
	function()
		return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
	end,
}

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"fiqryq/wakastat.nvim",
		},
		event = "VeryLazy",
		init = function()
			vim.o.laststatus = 3
			vim.o.cmdheight = 0
		end,
		opts = {
			always_show_tabline = false,
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return str:sub(1, 1)
						end,
					},
				},
				lualine_b = { project, "branch", "diagnostics" },
				lualine_c = { wakastat },
				lualine_x = { selectioncount, "searchcount", "lsp_status" },
				lualine_y = {
					"encoding",
					{
						"fileformat",
						symbols = {},
					},
					"location",
				},
				lualine_z = { { "datetime", style = "Uhrzeit %H:%M" } },
			},
			options = {
				globalstatus = true,
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},
		},
	},
}
