return {
  cmd = { 'lua-language-server' },
  root_markers = { 'package.json', '.git' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
}
