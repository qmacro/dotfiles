return {
  {
    "pappasam/nvim-repl",
    lazy = false,
    init = function()
      vim.g["repl_filetype_commands"] = {
        bash = "bash",
        javascript = "node",
        cds = "cds repl",
      }
    end,
    keys = {
      { "<Leader>rr",  "<Cmd>ReplOpen<cr>",                   mode = "n", desc = "Start default REPL" },
      { "<Leader>cds", "<Cmd>ReplOpen cds\\ repl<CR>ctrl-wH", mode = "n", desc = "Start cds REPL" },
      { "<Leader>cc",  "<Cmd>ReplNewCell<CR>",                mode = "n", desc = "Create New Cell" },
      { "<Leader>cr",  "<Plug>(ReplSendCell)",                mode = "n", desc = "Send Repl Cell" },
      { "<Leader>r",   "<Plug>(ReplSendLine)",                mode = "n", desc = "Send Repl Line" },
      { "<Leader>r",   "<Plug>(ReplSendVisual)",              mode = "x", desc = "Send Repl Visual Selection" },
    },
  }
}
