local M = {}

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.handlerWithoutHints = {
	["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
		result.diagnostics = vim.tbl_filter(function(diagnostic)
			return diagnostic.severity ~= vim.diagnostic.severity.HINT
		end, result.diagnostics)
		return vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
	end,
}

M.on_attach = function(_, bufnr)
	require("keymaps").setup(bufnr)
end

M.on_attach_disable_native_format = function(client, bufnr)
	require("keymaps").setup(bufnr)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
end

return M
