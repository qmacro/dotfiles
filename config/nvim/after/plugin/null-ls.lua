local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = true,
    sources = {
        formatting.prettier,
        -- formatting.prettier.with({
        --     extra_args = {
        --         '--no-semi',
        --         '--single-quote',
        --     }
        -- }),
        formatting.shfmt,
        -- formatting.shfmt.with({
        --     extra_args = {
        --         '--indent 2',
        --         '--binary-next-line',
        --         '--case-indent',
        --         '--space-redirects',
        --     }
        -- }),
        -- null_ls.builtins.diagnostics.shellcheck.with({
        --     method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
        -- })
    }
})
