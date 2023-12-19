local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },

    experimental = {
        ghost_text = true,
    },

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({

        -- Move between suggested items
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-b>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<CR>']  = cmp.mapping.confirm({ select = true }),
        ['<C-o>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4)

    }),

    sources = cmp.config.sources({
        { name = 'nvim_lua' },
    }, {
        -- { name = 'vsnip' },
        { name = 'path' },
        { name = 'buffer', keyword_length = 5 },
    }),

    formatting = {
        format = lspkind.cmp_format {
            mode = 'text',
            menu = {
                buffer = "[buffer]",
                nvim_lua = "[nvim_lua]",
                path = "[path]",
                vsnip = "[snip]",
            },
        },
    },

})

cmp.setup.cmdline({'/', '?'}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline' },
    })
})
