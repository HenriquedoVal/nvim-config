local cmp = require('cmp')

if not cmp then
	return
end

cmp.setup({
	snippet = { expand = function(args)
		require('luasnip').lsp_expand(args.body)
	end},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered()
	},
	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({select = false}),
	}),
	sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'luasnip' },
		}, {
			{ name = 'buffer' },
	})
})

local cmp_map = cmp.mapping.preset.cmdline()
cmp_map['<down>'] = cmp_map['<Tab>']
-- cmp_map['<up>'] = cmp_map['<S-Tab>']

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp_map,
	sources = { { name = 'buffer' } }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp_map,
	sources = cmp.config.sources(
		{{ name = 'path' }},
		{{ name = 'cmdline' }}
	)
})
