-- PLUGIN MANAGER

require("config.lazy")

-- LANGUAGE SERVER PROTOCOL

-- LSP-based completion support
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end
})

-- Control LSP support by filetype
vim.lsp.enable({
  'javascript',
  'cds',
  -- 'lua',
})

-- LSP logging
vim.lsp.set_log_level("WARN")

-- DIAGNOSTICS

-- How diagnostics are displayed
vim.diagnostic.config({
  virtual_lines = { current_line = true },
  severity_sort = true
})

-- GENERAL OPTIONS

vim.opt.list = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "yes:1"
vim.opt.cursorline = true
vim.opt.splitright = true
vim.opt.winborder = "rounded"

-- FILETYPES

vim.filetype.add({ extension = { cds = 'cds' } })


