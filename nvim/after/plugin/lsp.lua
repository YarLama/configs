local lspconfig = require("lspconfig")
local shared = require("lsp.init")

local servers = {
	"lua_ls",
	"ts_ls",
	"eslint",
	"yamlls",
	"cssls",
	"bashls",
	"tailwindcss",
}

for _, server in ipairs(servers) do
	local ok, config = pcall(require, "lsp.servers." .. server)
	if ok then
		lspconfig[server].setup(vim.tbl_deep_extend("force", {
			on_attach = shared.on_attach,
			capabilities = shared.capabilities,
		}, config or {}))
	else
		lspconfig[server].setup({
			on_attach = shared.on_attach,
			capabilities = shared.capabilities,
		})
	end
end
