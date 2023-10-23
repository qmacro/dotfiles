local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }
    lsp_zero.default_keymaps({ buffer = bufnr })
    vim.keymap.set('n', 'fo', function() vim.lsp.buf.format() end, opts)
end)
