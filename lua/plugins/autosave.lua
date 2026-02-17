return {
	"okuuva/auto-save.nvim",
	opts = {
		condition = function(buf_number)
			return not vim.bo[buf_number].readonly
		end,
		write_all_buffers = false,
		debounce_delay = 5000,
	},
}
