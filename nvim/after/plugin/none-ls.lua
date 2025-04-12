local null_ls = require("null-ls")
local map = vim.keymap.set

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettier.with({
      runtime_condition = function (params)
        print("[Prettier]: Format file: " .. params.bufname)
        return true
      end
    }),
		null_ls.builtins.formatting.stylua,
		require("none-ls.diagnostics.eslint_d").with({
			condition = function(utils)
				return utils.root_has_file({ ".eslintrc", ".eslintrc.json", ".eslintrc.js", "eslint.config.js" })
			end,
		}),
	},
})

map("n", "<leader>pf", vim.lsp.buf.format, {})
