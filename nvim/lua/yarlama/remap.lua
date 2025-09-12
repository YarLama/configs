local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "<leader>L", vim.cmd.Lazy, {desc = "open Lazy"})

map("v", "<C-c>", '"+y', { desc = "yanked to general clipboard (+ register)" })
map("n", "<C-p>", '"+p', { desc = "paste from general clipboard (+ register)" })
map("v", "<C-p>", '"+p', { desc = "paste from general clipboard (+ register)" })
map("n", "<leader>rw", 'ciw', { desc = "delete word" })
map("n", '<leader>r"', 'ci"', { desc = "delete inside double quotes" })
map("n", "<leader>r'", "ci'", { desc = "delete inside single quotes" })
map("n", '<leader>r`', "ci`", { desc = "delete inside backtips quotes" })
map("n", "<leader>r(", 'ci(', { desc = "delete inside () brackets" })
map("n", "<leader>r[", 'ci[', { desc = "delete inside [] brackets" })
map("n", "<leader>r{", 'ci{', { desc = "delete inside {} brackets" })
map("n", '<leader>v"', 'vi"', { desc = "selected text inside double quotes" })
map("n", "<leader>v'", "vi'", { desc = "selected text inside single quotes" })
map("n", '<leader>v`', "vi`", { desc = "selected text inside backtips quotes" })
map("n", "<leader>v(", 'vi(', { desc = "selected text inside () brackets" })
map("n", "<leader>v[", 'vi[', { desc = "selected text inside [] brackets" })
map("n", "<leader>v{", 'vi{', { desc = "selected text inside {} brackets" })

map("n", "<leader>q", '%', { desc = "jump to any matching pair" })
map("n", "<leader>z", '^i', { desc = "insert mode on last character" })
map("n", "<leader>x", '$a', { desc = "insert mode on first character" })
map("n", "<leader>o", 'o<Esc>', { desc = "move text under cursor, without insert mode" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selected text up one position" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selected text down one position" })
