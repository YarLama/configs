require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ts_ls", "eslint", "yamlls", "cssls" },
})

local map = vim.keymap.set
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
local handlerWithoutHints = {
	["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
		result.diagnostics = vim.tbl_filter(function(diagnostic)
			return diagnostic.severity ~= vim.diagnostic.severity.HINT
		end, result.diagnostics)
		return vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
	end,
}
local on_attach = function(client, bufnr)
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

	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
end

local on_attach_yaml = function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	map("n", "<leader>lr", function()
		vim.lsp.buf.rename()
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

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	mapping = {
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<tab>"] = cmp.mapping.select_next_item(cmp_select),
		["<S-tab>"] = cmp.mapping.select_prev_item(cmp_select),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "ultisnips" },
		{ name = "path" },
	}, {
		{ name = "buffer", keyword_length = 3 },
	}),
})

lspconfig.ts_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = handlerWithoutHints,
})
lspconfig.eslint.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	handlers = handlerWithoutHints,
})
lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
lspconfig.yamlls.setup({
	capabilities = capabilities,
	settings = {
		yaml = {
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*.yml",
			},
			format = { enabled = true },
			validate = true,
			hover = true,
			completion = true,
		},
	},
	on_attach = on_attach_yaml,
})
lspconfig.cssls.setup({
  capabilities = capabilities
})
