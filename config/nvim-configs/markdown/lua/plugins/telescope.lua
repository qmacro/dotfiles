return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require("telescope").setup {
        defaults = {
          layout_strategy = 'horizontal',
          layout_config = { preview_width = 0.6 }
        },
        extensions = {
          fzf = {}
        }
      }
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<space>fo", builtin.oldfiles)
      vim.keymap.set("n", "<space>fh", builtin.help_tags)
      -- Use ripgrep with options to show hidden files but ignore those in .git/
      vim.keymap.set("n", "<space>fd",
        function() builtin.find_files { find_command = { 'rg', '--files', '--glob', '!.git/', '--hidden' } } end)
      vim.keymap.set("n", "<space>fp", function() builtin.find_files { cwd = "/work/projects", follow = true } end)
      vim.keymap.set("n", "<space>en",
        function() builtin.find_files { cwd = vim.fn.stdpath("config") } end)

      vim.keymap.set("n", "<space>ec",
        function() builtin.find_files { cwd = "$HOME/.config", follow = true, hidden = true } end)
    end
  },
}
