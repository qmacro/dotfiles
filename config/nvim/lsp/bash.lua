return {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'bash', 'sh' },
  settings = {
    bashIde = {
      logLevel = 'debug',
      shfmt = {
        path = vim.fn.expand('$HOME') .. '/dotfiles/scripts/shfmt-wrapper'
      }
    },
  },
}
