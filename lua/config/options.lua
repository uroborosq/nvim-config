local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.opt.shortmess:append("I")

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.cmd([[
" system clipboard
nmap <c-c> "+y
vmap <c-c> "+y
nmap <c-v> "+p
inoremap <c-v> <c-r>+
cnoremap <c-v> <c-r>+
" use <c-r> to insert original character without triggering things like auto-pairs
inoremap <c-r> <c-v>
]])

vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true })
vim.keymap.set({ "n", "v" }, "<Del>", '"_<Del>', { noremap = true })
vim.keymap.set("n", "dd", '"_dd', { noremap = true })
vim.keymap.set("n", "D", '"_D', { noremap = true })
vim.keymap.set({ "n", "v" }, "c", '"_c', { noremap = true })
vim.keymap.set({ "n", "v" }, "p", "P", { noremap = true })

map("n", "<leader>w", "<cmd>w<cr>", vim.tbl_extend("force", opts, { desc = "Save file" }))
map("n", "<leader>q", "<cmd>q<cr>", vim.tbl_extend("force", opts, { desc = "Quit" }))

-- пример: удобное закрытие буфера
map("n", "<leader>c", "<cmd>bdelete<cr>", vim.tbl_extend("force", opts, { desc = "Delete buffer" }))
map("n", "<leader>Q", "<cmd>qa<cr>", vim.tbl_extend("force", opts, { desc = "Delete buffer" }))
map("n", "|", ":vsplit<cr>", vim.tbl_extend("force", opts, { desc = "Delete buffer" }))
map("n", "\\", "<cmd>split<cr>", vim.tbl_extend("force", opts, { desc = "Delete buffer" }))

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.relativenumber = true -- sets vim.opt.relativenumber
vim.opt.number = true -- sets vim.opt.numbe
vim.opt.spell = true
vim.opt.spelllang = { "en_us", "ru" }
vim.opt.spelloptions = "camel"
-- vim.opt.signcolumn = "auto" -- sets vim.opt.signcolumn to auto
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
-- vim.opt.laststatus = 3
vim.opt.autoread = true
vim.opt.expandtab = true
vim.opt.langmap =
	'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯХЪБЮЖфисвуапршолдьтщзйкыегмцчняхъюэ;ABCDEFGHIJKLMNOPQRSTUVWXYZ{}<>:abcdefghijklmnopqrstuvwxyz[]."'
vim.o.autoread = true
vim.g.autoread = true

vim.opt.splitright = true
vim.opt.splitbelow = true
