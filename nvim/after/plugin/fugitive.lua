local map = vim.keymap.set
map("n", "<leader>gg", ":Git | wincmd L | :Git log --oneline | wincmd j<CR>", { noremap = true, silent = true })
map("n", "<leader>gc", ":wincmd h | wincmd o<CR>", { noremap = true, silent = true })
