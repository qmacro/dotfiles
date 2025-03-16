return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require("telescope").setup {
        pickers = {
          find_files = {
            theme = "dropdown"
          }
        },
        extensions = {
          fzf = {}
        }
      }
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<space>fh", builtin.help_tags)
      vim.keymap.set("n", "<space>fd", builtin.find_files)
      vim.keymap.set("n", "<space>en", function() builtin.find_files { cwd = vim.fn.stdpath("config") } end)

      vim.keymap.set("n", "<space>ec",
        function() builtin.find_files { cwd = "$HOME/.config", follow = true } end)
    end
  },
}
