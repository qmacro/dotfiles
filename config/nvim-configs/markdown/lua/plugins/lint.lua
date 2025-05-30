return {
  {
    'mfussenegger/nvim-lint',
    config = function()
      require('lint').linters_by_ft = {
        markdown = { 'vale', 'markdownlint' },
      }
      vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end
      })
    end
  }
}
