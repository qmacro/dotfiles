vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

require('packer').startup(function(use)
  -- Packer manages itself
  use 'wbthomason/packer.nvim'

  -- Colour scheme
  use 'joshdick/onedark.vim'

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- Nice status line
  use 'nvim-lualine/lualine.nvim'

  -- JSON Schema store Support
  use 'b0o/schemastore.nvim'

end)

vim.opt.signcolumn = 'yes'
vim.opt.termguicolors = true
pcall(vim.cmd, 'colorscheme onedark')

local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()

require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua" },
  highlight = {
    enable = true
  },
}

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
  }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require('lspconfig').jsonls.setup {
  capabilities = capabilities,
  settings = {
    json = {
      schemas = vim.list_extend(
        {
          {
            description = 'BTP Service Metadata',
            fileMatch = { '*usecase.json' },
            name = 'Use Case',
            url = 'https://raw.githubusercontent.com/SAP-samples/btp-setup-automator/main/libs/btpsa-usecase.json',
          },
        },
        require('schemastore').json.schemas()
      ),
      validate = { enable = true },
    }
  }
}
