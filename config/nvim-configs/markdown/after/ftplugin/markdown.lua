vim.cmd [[ colorscheme catppuccin-frappe ]]
vim.keymap.set("n", "<leader>tt", function() vim.lsp.buf.document_symbol() end)
