return {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'bash', 'sh' },
  settings = {
    bashIde = {
      logLevel = 'debug',
      shfmt = {
        path = '/home/dj/.local/bin/shfmt-wrapper'
      }
    },
  },
}
