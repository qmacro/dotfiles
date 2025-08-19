return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim'
    },
    config = function()
      require('neogit').setup({
        vim.keymap.set('n', '<leader>g', '<cmd>Neogit<cr>'),
        vim.cmd('colorscheme kanagawa-wave')
      })
    end
  }
}
