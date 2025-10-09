return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.statusline').setup({ use_icons = false })
      require('mini.surround').setup()
    end
  }
}
