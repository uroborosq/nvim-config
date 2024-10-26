vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true })
vim.keymap.set({ "n", "v" }, "<Del>", '"_<Del>', { noremap = true })
vim.keymap.set("n", "dd", '"_dd', { noremap = true })
-- vim.keymap.set({ "n", "v" }, "s", '"_s', { noremap = true })
vim.keymap.set({ "n", "v" }, "p", "P", { noremap = true })

vim.o.autoread = true

vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = { "*" },
})

vim.cmd [[
" system clipboard
nmap <c-c> "+y
vmap <c-c> "+y
nmap <c-v> "+p
inoremap <c-v> <c-r>+
cnoremap <c-v> <c-r>+
" use <c-r> to insert original character without triggering things like auto-pairs
inoremap <c-r> <c-v>
]]
