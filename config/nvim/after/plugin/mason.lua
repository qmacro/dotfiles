local lsp_zero = require('lsp-zero')

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'jsonls',
        'lua_ls',
        'tsserver',
    },
    handlers = {
        lsp_zero.default_setup
    }
})
