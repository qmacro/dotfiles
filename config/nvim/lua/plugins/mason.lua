return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "bash-language-server",
          "docker-language-server",
          "typescript-language-server",
          "lua-language-server",
          "cds-lsp",
          "marksman",
        },
        auto_update = false,
        run_on_start = true,
      })
    end,
  },
}
