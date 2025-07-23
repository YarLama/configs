local map = vim.keymap.set

map("n", "<leader>ee", ":NvimTreeToggle<CR>", { silent = true})
map("n", "<leader>ef", ":NvimTreeFindFile<CR>", { silent = true})
