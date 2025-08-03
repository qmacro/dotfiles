-- PLUGIN MANAGER

require("config.lazy")

-- LANGUAGE SERVER PROTOCOL

-- LSP-based completion support
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end
})

-- LSP config
vim.lsp.config("lua", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})

-- Control LSP support by filetype
vim.lsp.enable({
  'javascript',
  'cds',
  'markdown',
  'dockerfile',
  'lua',
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
vim.opt.paste = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "yes:1"
vim.opt.cursorline = true
vim.opt.splitright = true
vim.opt.winborder = "rounded"
vim.opt.completeopt:append("fuzzy,noinsert")

-- FILETYPES

vim.filetype.add({
  extension = { cds = 'cds' },
  filename = {
    ['.markdownlintrc'] = 'json',
    ['rules.vr'] = 'text',
  }
})

vim.cmd "colorscheme retrobox"
