return {
  cmd = { 'docker-langserver', '--stdio' },
  root_markers = { 'Dockerfile', 'package.json', '.git' },
  filetypes = { 'dockerfile' }
}
