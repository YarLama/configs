local vim = vim
local map = vim.keymap.set


local M = {}

function M.setup(bufnr)
	local opts = { buffer = bufnr, remap = false }

	map("n", "<leader>lr", function()
		vim.lsp.buf.rename()
	end, opts)
	map("n", "<leader>la", function()
		vim.lsp.buf.code_action()
	end, opts)
	map("n", "<leader>ls", function()
		vim.lsp.buf.signature_help()
	end, opts)
	map("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	map("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	map("n", "<leader>lf", function()
		vim.diagnostic.open_float()
	end, opts)

	map("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	map("n", "gi", function()
		vim.lsp.buf.implementation()
	end, opts)
	map("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
end

return M
