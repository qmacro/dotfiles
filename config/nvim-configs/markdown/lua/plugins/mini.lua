return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.surround').setup()
      require('mini.ai').setup()
      require('mini.statusline').setup({ use_icons = true })
      -- require('mini.completion').setup()
      -- require('mini.snippets').setup()
      -- require('mini.icons').setup()
      -- MiniIcons.tweak_lsp_kind()
      -- vim.cmd [[ colorscheme minischeme ]]
    end
  }
}
