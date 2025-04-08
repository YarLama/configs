local shared = dofile(vim.fn.stdpath("config") .. "/after/plugin/lsp/init.lua")

return {
	handlers = shared.handlersWithoutHints,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}
