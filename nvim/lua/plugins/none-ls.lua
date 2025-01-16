return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.stylua,
				require("none-ls.diagnostics.eslint_d").with({
					condition = function(utils)
						return utils.root_has_file({ ".eslintrc", ".eslintrc.json", ".eslintrc.js", "eslint.config.js" })
					end,
				}),
			},
		})

		vim.keymap.set("n", "<leader>pf", vim.lsp.buf.format, {})
	end,
}
