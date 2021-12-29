Plug 'dense-analysis/ale'

let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
      \ 'sh':         ['shellcheck', 'language_server'],
      \ 'yaml':       ['yamllint'],
      \ 'markdown':   ['markdownlint'],
      \ 'dockerfile': ['hadolint'],
      \ }
let g:ale_fixers = {
      \ 'sh':       ['shfmt'],
      \ '*':        ['remove_trailing_lines', 'trim_whitespace'],
      \}

" See https://github.com/SAP-samples/devtoberfest-2021/tree/main/topics/Week2_Best_Practices/challenge#consistent-source-formatting
let g:ale_sh_shfmt_options='-i 2 -bn -ci -sr'
let g:ale_markdown_markdownlint_options = '--config ~/.markdownlintrc'

nmap <silent> <F8> :ALENextWrap<cr>
nmap <silent> <S-F8> :ALEPreviousWrap<cr>
nmap <silent> <leader>ad :ALEGoToDefinition<cr>
nmap <silent> <leader>ar :ALEFindReferences<cr>
