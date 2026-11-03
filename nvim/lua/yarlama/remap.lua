local map = vim.keymap.set
local t_o = require("custom.term_output")
local text = require("custom.text")

vim.g.mapleader = " "

map("n", "<leader>L", vim.cmd.Lazy, { desc = "open Lazy" })

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
map("n", "<leader>rs{", function()
  text.delete_surround_by_char("{")
end, { desc = "delete {} brackets" })
map("n", "<leader>rs(", function()
  text.delete_surround_by_char("(")
end, { desc = "delete () brackets" })
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
map({ "n", "v" }, "<Down>", "v:count == 0 ? 'gj' : 'j'",
  { expr = true, silent = true, desc = "moving for wrapped string" })
map({ "n", "v" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "moving for wrapped string" })

-- custom remaps
map("n", "<leader>tt", t_o.run_input_command, { desc = "execute command and put the result in a split window" })
map("n", "<leader>tr", t_o.run_last_command, { desc = "execute last command and put the result in a split window" })
map("n", "<leader>tq", t_o.close_window, { desc = "close the window with the command result" })
map("n", "<leader>nd", function()
  vim.cmd('new')
  vim.opt_local.buftype = 'nofile'
  vim.opt_local.bufhidden = 'hide'
  vim.opt_local.swapfile = false
  vim.opt_local.virtualedit = 'all'
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
  vim.cmd('normal! yy')
  vim.cmd('normal! 20p')
  vim.cmd('normal! gg0')
end, { desc = "Create a draft window" })
