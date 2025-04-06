require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ts_ls", "eslint", "yamlls", "cssls", "tailwindcss", "bashls" },
})
