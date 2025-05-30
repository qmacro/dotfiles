-------------------------------------------------------------------------------
-- Options
-------------------------------------------------------------------------------
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"

vim.cmd [[ colorscheme retrobox ]]

-------------------------------------------------------------------------------
-- Bootstrap Package Manager
-------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("Installing 'folke/lazy.nvim'...")
  vim.fn.system({ "git", "clone", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-------------------------------------------------------------------------------
-- Plugins
-------------------------------------------------------------------------------
require("lazy").setup {
  { "nvim-lualine/lualine.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = true },
  { "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = "nvim-lua/plenary.nvim",
    keys = {
      { "<C-t>", "<CMD>Telescope<CR>",             mode = { "n", "i", "v" } },
      { "<C-p>", "<CMD>Telescope find_files<CR>",  mode = { "n", "i", "v" } },
      { "<C-l>", "<CMD>Telescope live_grep<CR>",   mode = { "n", "i", "v" } },
      { "<C-c>", "<CMD>Telescope commands<CR>",    mode = { "n", "i", "v" } },
      { "<C-k>", "<CMD>Telescope keymaps<CR>",     mode = { "n", "i", "v" } },
      { "<C-s>", "<CMD>Telescope grep_string<CR>", mode = { "n", "i", "v" } },
    },
    config = true },
  { "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "c", "lua", "rust" },
        highlight = { enable = true, }
      }
    end },
  { "terrortylor/nvim-comment",
    keys = {
      { "<C-_>", "<CMD>CommentToggle<CR>j",             mode = { "n" } },
      { "<C-_>", "<C-\\><C-N><CMD>CommentToggle<CR>ji", mode = { "i" } },
      { "<C-_>", ":'<,'>CommentToggle<CR>gv<esc>j",     mode = { "v" } },
    },
    config = function()
      require("nvim_comment").setup()
    end },
}
