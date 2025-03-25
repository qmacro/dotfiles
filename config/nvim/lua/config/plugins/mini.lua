return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.statusline').setup({ use_icons = true })
      require('mini.starter').setup()
      vim.keymap.set("n", "<space>ms", MiniStarter.open)
    end
  }
}
