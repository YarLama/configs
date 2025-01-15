local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Telescope find git files" })
vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Telescope view git files status" })
vim.keymap.set("n", "<leader>gl", builtin.git_commits, { desc = "Telescope view git commits" })
vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Telescope view git branches" })
vim.keymap.set("n", "<leader>gg", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

require("telescope").setup({
    defaults = {
        file_ignore_patterns = {"node_modules"}
    },
    pickers = {
        find_files = {
            disable_devicons = true,
        },
        git_files = {
            disable_devicons = true,
        },
        git_status = {
            disable_devicons = true,
        },
        git_commits = {
            disable_devicons = true,
        },
        git_branches = {
            disable_devicons = true,
        },
    },
})
