local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }
    lsp_zero.default_keymaps({ buffer = bufnr })
    vim.keymap.set('n', 'fo', function() vim.lsp.buf.format() end, opts)
end)

local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')
if not configs.sapcds_lsp then
    configs.sapcds_lsp = {
        default_config = {
            cmd = {
                vim.fn.expand('cds-lsp'), '--stdio'
            },
            filetypes = { 'cds' },
            root_dir = lspconfig.util.root_pattern('.git', 'package.json'),
            settings = {}
        }
    }
end
if lspconfig.sapcds_lsp.setup then
    lspconfig.sapcds_lsp.setup({})
end
