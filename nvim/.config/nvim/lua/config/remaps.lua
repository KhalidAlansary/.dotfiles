vim.g.mapleader = " "

vim.keymap.set({ "o", "x" }, "aq", 'a"')
vim.keymap.set({ "o", "x" }, "iq", 'i"')

vim.keymap.set({ "o", "x" }, "at", "a<")
vim.keymap.set({ "o", "x" }, "it", "i<")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Navigate vim panes better
vim.keymap.set("n", "<C-k>", function()
	vim.cmd.wincmd("k")
end)
vim.keymap.set("n", "<C-j>", function()
	vim.cmd.wincmd("j")
end)
vim.keymap.set("n", "<C-h>", function()
	vim.cmd.wincmd("h")
end)
vim.keymap.set("n", "<C-l>", function()
	vim.cmd.wincmd("l")
end)

-- NOTE: Delete if not using github copilot
vim.keymap.set("n", "<leader>cpe", ":Copilot enable<CR>", { desc = "Enable Copilot" })
vim.keymap.set("n", "<leader>cpd", ":Copilot disable<CR>", { desc = "Disable Copilot" })

-- Make <C-]> work as expected with programmer dvorak layout on Windows
-- vim.api.nvim_set_keymap("n", "<char-30>", "<C-]>", {})
