vim.defer_fn(function()

    -- Install treesitter for CDS
    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.cds = {
        install_info = {
            -- local path or git repo
            url = "https://github.com/cap-js-community/tree-sitter-cds.git",
            -- url = "/path/to/tree-sitter-cds",
            branch = "main",
            files = { "src/parser.c", "src/scanner.c" }
        },
        filetype = "cds",
        -- additional filetypes that use this parser
        used_by = { "cdl", "hdbcds" }
    }

    require 'nvim-treesitter.configs'.setup({

        -- A list of parser names, or "all"
        ensure_installed = {
            -- These should always be installed
            "c",
            "lua",
            "vim",
            "vimdoc",
            "query",

            -- Others
            "cds",
            "javascript",
            "json",
            "jq",
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        highlight = {
            enable = true,

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },

        indent = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<leader>.',
                node_incremental = '<leader>.',
                node_decremental = '<leader>,',
                scope_incremental = '<c-s>', -- TODO: what is this for?
            }
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                keymaps = {
                    ['aa'] = '@parameter.outer',
                    ['ia'] = '@parameter.inner',
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                    ['ac'] = '@class.outer',
                    ['ai'] = '@class.inner',
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- Whether to set jumps in the jumplist
                goto_next_start = {
                    [']m'] = '@function.outer',
                    [']]'] = '@class.outer',
                },
                goto_next_end = {
                    [']M'] = '@function.outer',
                    [']['] = '@class.outer',
                },
                goto_previous_start = {
                    ['[m'] = '@function.outer',
                    ['[]'] = '@class.outer',
                },
                goto_previous_end = {
                    ['[M'] = '@function.outer',
                    ['[['] = '@class.outer',
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ['<leader>a'] = '@parameter.inner',
                },
                swap_previous = {
                    ['<leader>a'] = '@parameter.inner',
                },
            },
        },

    })
end, 0)
