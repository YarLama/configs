local map = vim.keymap.set

vim.g.mapleader = " "
map("n", "<leader>e", vim.cmd.Ex)

map("v", "<C-c>", '"+y')
map("n", "<C-p>", '"+p')
map("v", "<C-p>", '"+p')
map("n", "<leader>rw", 'ciw')
map("n", "<leader>rq", 'ci"')
map("n", "<leader>z", '^i')
map("n", "<leader>x", '$a')
map("n", "<leader>o", 'o<Esc>')

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

