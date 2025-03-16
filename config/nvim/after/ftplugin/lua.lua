local set = vim.opt_local

set.shiftwidth = 2
set.expandtab = true
set.number = true

vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
