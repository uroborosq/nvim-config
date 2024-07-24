vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true })
vim.keymap.set({ "n", "v" }, "<Del>", '"_<Del>', { noremap = true })
vim.keymap.set("n", "dd", '"_dd', { noremap = true })
vim.keymap.set({ "n", "v" }, "s", '"_s', { noremap = true })
vim.keymap.set({ "n", "v" }, "p", "P", { noremap = true })

vim.o.autoread = true

vim.o.autowrite = true

vim.diagnostic.config {
    virtual_text = false,
}
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = { "*" },
})
