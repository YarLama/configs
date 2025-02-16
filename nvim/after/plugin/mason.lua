require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "ts_ls", "eslint" },
})

local map = vim.keymap.set
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    map("n", "<leader>vrn", function()
        vim.lsp.buf.rename()
    end, opts)
    map("n", "<leader>vca", function()
        vim.lsp.buf.code_action()
    end, opts)
    map("n", "<leader>vh", function()
        vim.lsp.buf.signature_help()
    end, opts)
    map("n", "[d", function()
        vim.diagnostic.goto_next()
    end, opts)
    map("n", "]d", function()
        vim.diagnostic.goto_prev()
    end, opts)
    map("n", "<leader>ve", function()
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
    map("n", "gr", require("telescope.builtin").lsp_references, opts)

    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
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
        { name = "buffer", keyword_length = 5 },
    }),
})

lspconfig.ts_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
lspconfig.eslint.setup({
    on_attach = on_attach,
    capabilities = capabilities,
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
