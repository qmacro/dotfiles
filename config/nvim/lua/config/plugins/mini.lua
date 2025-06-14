return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.statusline').setup({ use_icons = true })
      require('mini.surround').setup()
      require('mini.ai').setup()
      require('mini.completion').setup()
      require('mini.snippets').setup()
      require('mini.icons').setup()
      vim.cmd [[ colorscheme minischeme ]]
    end
  }
}
