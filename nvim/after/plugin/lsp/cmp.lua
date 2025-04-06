local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select}

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
