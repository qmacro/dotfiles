-- Bootstrap lazy.nvim (i.e. install if not present) then set it up
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

    -- Colour scheme
    { 'folke/tokyonight.nvim' },

    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    { 'nvim-treesitter/playground' },

    -- Source code control utils
    { 'mbbill/undotree' },
    { 'tpope/vim-fugitive' },

    -- Package manager for LSP servers, linters, formatters etc
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    -- LSP support
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x', lazy = true, config = false },
    { 'neovim/nvim-lspconfig', dependencies = { 'hrsh7th/cmp-nvim-lsp' } },

    -- Autocompletion
    { 'hrsh7th/nvim-cmp', dependencies = { 'L3MON4D3/LuaSnip' } },

    -- Fuzzy finder
    { 'nvim-telescope/telescope.nvim', tag = '0.1.4', dependencies = { 'nvim-lua/plenary.nvim' } },

    -- Quick file switcher
    { 'theprimeagen/harpoon' },

})
