
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set("n", "<C-p>", '"+p')
vim.keymap.set("v", "<C-p>", '"+p')
vim.keymap.set("n", "<leader>rw", 'ciw')
vim.keymap.set("n", "<leader>rq", 'ci"')
vim.keymap.set("n", "<leader>z", '^i')
vim.keymap.set("n", "<leader>x", '$a')
vim.keymap.set("n", "<leader>o", 'o<Esc>')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

