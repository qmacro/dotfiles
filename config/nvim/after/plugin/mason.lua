local lsp_zero = require('lsp-zero')

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        -- "awk_ls",
        -- "bashls",
        -- "dockerls",
        -- "docker_compose_language_service",
        -- "jqls",
        -- "jsonls",
        -- "lua_ls",
        -- "marksman",
        "tsserver",
        -- "yamlls"
    },
    handlers = {
        lsp_zero.default_setup
    }
})
