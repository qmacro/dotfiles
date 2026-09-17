require("config.lazy")

vim.api.nvim_create_autocmd('User', { pattern = 'TSUpdate',
callback = function()
  require('nvim-treesitter.parsers').cds = {
    install_info = {
      url = 'https://github.com/SAP-archive/tree-sitter-cds',
    },
  }
end})

vim.filetype.add({
  extension = {
    ['cds'] = 'cds',
    ['njk'] = 'xml'
  },
  filename = {
    ['.markdownlintrc'] = 'json',
    ['rules.vr'] = 'text',
  }
})

require('nvim-treesitter').install {
  'cds',
  'javascript',
  'lua',
  'markdown'
}

vim.opt.number = true
vim.cmd('colorscheme minischeme')

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'cds' },
  callback = function() vim.treesitter.start() end,
})
