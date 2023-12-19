vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, { pattern = '*.cds', command = 'set filetype=cds' })
