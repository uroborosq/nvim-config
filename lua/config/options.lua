local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.opt.shortmess:append("I")

vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.opt.clipboard = "unnamedplus"
vim.opt.hlsearch = false

-- undotree
vim.cmd("packadd nvim.undotree")
vim.keymap.set({ "n" }, "<leader>U", "<cmd>Undotree<cr>", { noremap = true, silent = true, desc = "Undo-Verlauf umschalten" })

local undo_dir = vim.fn.stdpath("data") .. "/undo"

if vim.fn.isdirectory(undo_dir) == 0 then
	vim.fn.mkdir(undo_dir, "p")
end

vim.opt.undodir = undo_dir
vim.opt.undofile = true

vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
	float = {
		enabled = true,
	},
	jump = {
		float = false,
	},
	underline = true,
}) -- Disable Neovim's default virtual text diagnostics

-- system clipboard
vim.keymap.set({ "n", "v" }, "<c-c>", '"+y', { remap = true, desc = "In Systemzwischenablage kopieren" })
vim.keymap.set("n", "<c-v>", '"+p', { remap = true, desc = "Aus Systemzwischenablage einfügen" })
vim.keymap.set({ "i", "c" }, "<c-v>", "<c-r>+", { desc = "Aus Systemzwischenablage einfügen" })
-- use <c-r> to insert original character without triggering things like auto-pairs
vim.keymap.set("i", "<c-r>", "<c-v>", { desc = "Zeichen wörtlich einfügen" })

vim.keymap.set({ "n", "v" }, "d", '"_d', { noremap = true, desc = "Löschen ohne Register" })
vim.keymap.set({ "n", "v" }, "<Del>", '"_<Del>', { noremap = true, desc = "Zeichen löschen ohne Register" })
vim.keymap.set("n", "dd", '"_dd', { noremap = true, desc = "Zeile löschen ohne Register" })
vim.keymap.set("n", "D", '"_D', { noremap = true, desc = "Bis Zeilenende löschen ohne Register" })
vim.keymap.set({ "n", "v" }, "c", '"_c', { noremap = true, desc = "Ändern ohne Register" })
vim.keymap.set({ "n", "v" }, "p", "P", { noremap = true, desc = "Einfügen ohne Register zu überschreiben" })
vim.keymap.set({ "n" }, "<esc>", "<cmd>noh<cr>", { silent = true, desc = "Suchhervorhebung aufheben" })

map("n", "<leader>w", "<cmd>w<cr>", vim.tbl_extend("force", opts, { desc = "Datei speichern" }))
map("n", "<leader>q", "<cmd>q<cr>", vim.tbl_extend("force", opts, { desc = "Fenster schließen" }))

map("n", "<leader>R", "<cmd>restart<cr>", vim.tbl_extend("force", opts, { desc = "Neustarten" }))

-- пример: удобное закрытие буфера
map("n", "<leader>c", "<cmd>bdelete<cr>", vim.tbl_extend("force", opts, { desc = "Puffer schließen" }))
map("n", "<leader>Q", "<cmd>qa<cr>", vim.tbl_extend("force", opts, { desc = "Alles beenden" }))
map("n", "|", "<cmd>vsplit<cr>", vim.tbl_extend("force", opts, { desc = "Vertikal teilen" }))
map("n", "\\", "<cmd>split<cr>", vim.tbl_extend("force", opts, { desc = "Horizontal teilen" }))

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Zum linken Fenster" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Zum rechten Fenster" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Zum unteren Fenster" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Zum oberen Fenster" })

-- langmap greift nicht bei Strg-Kombinationen: im russischen Layout kommt <C-р> statt <C-h> an.
-- remap leitet auf die lateinische Taste um, damit alle ihre Mappings greifen
-- (Fensterwechsel, Terminal, Telescope, blink).
for ru, en in pairs({ ["р"] = "h", ["о"] = "j", ["л"] = "k", ["д"] = "l" }) do
	vim.keymap.set({ "n", "x", "s", "o", "i", "c", "t" }, "<C-" .. ru .. ">", "<C-" .. en .. ">", {
		remap = true,
		desc = "Strg+" .. en .. " (russisches Layout)",
	})
end

vim.keymap.set("n", "<C-S-Up>", "<cmd>resize +2<cr>", { desc = "Fensterhöhe vergrößern", silent = true })
vim.keymap.set("n", "<C-S-Down>", "<cmd>resize -2<cr>", { desc = "Fensterhöhe verkleinern", silent = true })
vim.keymap.set("n", "<C-S-Left>", "<cmd>vertical resize -2<cr>", { desc = "Fensterbreite verkleinern", silent = true })
vim.keymap.set("n", "<C-S-Right>", "<cmd>vertical resize +2<cr>", { desc = "Fensterbreite vergrößern", silent = true })

vim.keymap.set({ "n", "t" }, "]T", "<cmd>tabnext<cr>", { desc = "Nächster Tab", silent = true })
vim.keymap.set({ "n", "t" }, "[T", "<cmd>tabprev<cr>", { desc = "Vorheriger Tab", silent = true })

vim.opt.tabstop = 4
-- vim.opt.termguicolors = true
vim.opt.relativenumber = true -- sets vim.opt.relativenumber
vim.opt.number = true -- sets vim.opt.numbe
vim.opt.spell = true
vim.opt.spelllang = { "en_us", "ru" }
vim.opt.spelloptions = "camel"
-- vim.opt.signcolumn = "auto" -- sets vim.opt.signcolumn to auto
vim.opt.wrap = false
vim.keymap.set("n", "<leader>uw", function()
	vim.opt_local.wrap = not vim.wo.wrap
	vim.notify("wrap: " .. tostring(vim.wo.wrap))
end, { silent = true, desc = "Zeilenumbruch umschalten" })
vim.keymap.set("n", "<leader>ud", function()
	local enabled = vim.diagnostic.is_enabled()
	vim.diagnostic.enable(not enabled)
	local ok, tiny = pcall(require, "tiny-inline-diagnostic")
	if ok then
		if enabled then
			tiny.disable()
		else
			tiny.enable()
		end
	end
	vim.notify("diagnostics: " .. tostring(not enabled))
end, { silent = true, desc = "Diagnosen umschalten" })
vim.keymap.set("n", "<leader>us", function()
	vim.opt_local.spell = not vim.wo.spell
	vim.notify("spell: " .. tostring(vim.wo.spell))
end, { silent = true, desc = "Rechtschreibprüfung umschalten" })
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

-- damit scope.nvim die Buffer-pro-Tab-Verteilung in Sessions speichert
vim.opt.sessionoptions:append("globals")
-- Terminals nicht in Sessions speichern: beim Wiederherstellen startet sonst ein neuer, leerer Prozess
vim.opt.sessionoptions:remove("terminal")
