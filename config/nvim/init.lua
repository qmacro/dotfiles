require("config.lazy")

vim.opt.list = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "yes:1"
vim.opt.cursorline = true
vim.opt.splitright = true

-- vim.cmd [[ colorscheme minischeme ]]

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")

-- Highlight when yanking text (see :help vim.highlight.on_yank())
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
