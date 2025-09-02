return {
  cmd = { 'docker-language-server', '--stdio' },
  root_markers = { 'Dockerfile', 'package.json', '.git' },
  filetypes = { 'dockerfile' }
}
