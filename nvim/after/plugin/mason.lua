require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "ts_ls", "vimls" }
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
local on_attach = function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next(), opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev(), opts)

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references , opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
end

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['<S-tab>'] = cmp.mapping.select_prev_item(cmp_select),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'ultisnips' },
    { name = 'path' },
  }, {
    { name = 'buffer', keyword_length = 5},
  }),
})

lspconfig.ts_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities
})
lspconfig.lua_ls.setup({
   settings = {
       Lua = {
           diagnostics = {
               globals = { "vim" }
           }
       }
   }
})
lspconfig.vimls.setup({})
