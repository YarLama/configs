local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Telescope view git files status' })
vim.keymap.set('n', '<leader>gl', builtin.git_commits, { desc = 'Telescope view git commits' })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Telescope view git branches' })
vim.keymap.set('n', '<leader>ps', function() 
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

