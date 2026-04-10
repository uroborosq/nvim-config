return {
	"norcalli/nvim-colorizer.lua",
	init = function()
		vim.api.nvim_create_autocmd("BufReadPost", {
			-- pattern = "VeryLazy",
			callback = function()
				vim.cmd(":ColorizerAttachToBuffer")
			end,
		})
	end,
}
