vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true })
vim.keymap.set({ "n", "v" }, "<Del>", '"_<Del>', { noremap = true })
vim.keymap.set("n", "dd", '"_dd', { noremap = true })
vim.keymap.set("n", "D", '"_D', { noremap = true })
vim.keymap.set({ "n", "v" }, "c", '"_c', { noremap = true })
vim.keymap.set({ "n", "v" }, "p", "P", { noremap = true })

if vim.loop.os_uname().sysname == "Windows_NT" then
  vim.opt.shell = "pwsh.exe"
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -Command" -- Флаги для запуска
  vim.opt.shellxquote = "" -- Отключает кавычки для совместимости с PowerShell

  -- vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
  -- vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
end

vim.o.autoread = true

local lspconfig = require "lspconfig"

-- Set global defaults for all servers
lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
  capabilities = vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    -- returns configured operations if setup() was already called
    -- or default operations if not
    require("lsp-file-operations").default_capabilities()
  ),
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
