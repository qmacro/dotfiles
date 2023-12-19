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

    -- Look and feel
    { 'Mofiqul/dracula.nvim' },
    { 'nvim-lualine/lualine.nvim' },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects'
        },
        build = ':TSUpdate'
    },

    -- Package manager for LSP servers, linters, formatters etc
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    -- LSP support and other linters and formatters
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        lazy = true,
        config = false
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp'
        }
    },
    {
        'mfussenegger/nvim-lint'
    },

    -- Finding & navigating
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },
    {
        'ThePrimeagen/harpoon'
    },

    -- Completion
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/nvim-cmp' },

    { 'hrsh7th/cmp-vsnip' },
    { 'hrsh7th/vim-vsnip' },
    { 'rafamadriz/friendly-snippets' },

    { 'onsails/lspkind.nvim' },

    -- Utils
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    }

})
