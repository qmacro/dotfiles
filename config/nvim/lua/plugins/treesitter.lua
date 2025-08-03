return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local parser_configs = require 'nvim-treesitter.parsers'.get_parser_configs()
      parser_configs.cds = {
        install_info = {
          url = 'https://github.com/cap-js-community/tree-sitter-cds.git',
          branch = 'main',
          files = { 'src/parser.c', 'src/scanner.c' }
        },
        filetype = 'cds'
      }
      require 'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all" (the listed parsers MUST always be installed)
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "bash", "javascript", "toml", "cds" },
        auto_install = false,
        highlight = {
          enable = true,
          disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  }
}
