local builtin = require("telescope.builtin")
local map = vim.keymap.set
map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", builtin.git_files, { desc = "Telescope find git files" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope find help info" })
map("n", "<leader>fs", builtin.git_status, { desc = "Telescope view git files status" })
map("n", "<leader>fc", builtin.git_commits, { desc = "Telescope view git commits" })
map("n", "<leader>fb", builtin.git_branches, { desc = "Telescope view git branches" })
map("n", "<leader>fu", "<cmd>Telescope undo<cr>", { desc = "Telescope undo extenstion" })
map("n", "<leader>fg", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "node_modules" },
	},
	extenstion = {
		undo = {
			mappings = {
				i = {
					["<cr>"] = require("telescope-undo.actions").yank_additions,
					["<C-y>"] = require("telescope-undo.actions").yank_deletions,
					["<C-r>"] = require("telescope-undo.actions").restore,
				},
				n = {
					["y"] = require("telescope-undo.actions").yank_additions,
					["Y"] = require("telescope-undo.actions").yank_deletions,
					["u"] = require("telescope-undo.actions").restore,
				},
			},
		},
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

require("telescope").load_extension("undo")
