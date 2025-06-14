return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.surround').setup()
      require('mini.statusline').setup({ use_icons = true })
      -- require('mini.bracketed').setup({
      --   diagnostic = { suffix = 'd', options = { float = false } }
      -- })
      -- require('mini.ai').setup()
      -- require('mini.completion').setup()
      -- require('mini.snippets').setup()
      -- require('mini.icons').setup()
      -- MiniIcons.tweak_lsp_kind()
      -- vim.cmd [[ colorscheme minischeme ]]
    end
  }
}
