" Reorg inspired by https://github.com/jessarcher/dotfiles
"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------
set expandtab
set shiftwidth=4
set tabstop=4
set hidden
set signcolumn=yes
set relativenumber
set number
set termguicolors
set undofile
set nospell
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set nojoinspaces
set splitright
set confirm
set exrc
set nobackup
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files
set hlsearch
set incsearch
set laststatus=2 " Have a status line even with a single file

"--------------------------------------------------------------------------
" Key mappings
"--------------------------------------------------------------------------
let mapleader = ","

" Prevent any use of the cursor keys by mapping them to 'no operation'
map <Up>    <nop>
map <Down>  <nop>
map <Left>  <nop>
map <Right> <nop>

" Shortcutting split navigation, saves a keypress
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <leader>ev :split $MYVIMRC<cr>
nmap <leader>sv :so $MYVIMRC<cr>

nmap <leader>h :set hls!<cr>
nmap <leader>Q :bufdo bdelete<cr>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

nmap <silent> <leader>l :set list!<cr>

" When text is wrapped, move by terminal rows, not lines, unless a count is provided
"noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
"noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
"vnoremap y myy`y
"vnoremap Y myY`y

"" Paste replace visual selection without copying it
"vnoremap <leader>p "_dP
"
"" Make Y behave like the other capitals
"nnoremap Y y$
"
" Keep it centered
"nnoremap n nzzzv
"nnoremap N Nzzzv
"nnoremap J mzJ`z

"" Easy insertion of a trailing ; or , from insert mode
"imap ;; <Esc>A;<Esc>
"imap ,, <Esc>A,<Esc>

"cmap w!! %!sudo tee > /dev/null %

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

source ~/.config/vim/plugins/lightline.vim
source ~/.config/vim/plugins/gitbranch.vim
source ~/.config/vim/plugins/ale.vim
source ~/.config/vim/plugins/fzf.vim
source ~/.config/vim/plugins/goyo-and-limelight.vim
source ~/.config/vim/plugins/fugitive.vim
source ~/.config/vim/plugins/surround.vim
source ~/.config/vim/plugins/repeat.vim
source ~/.config/vim/plugins/unimpaired.vim
source ~/.config/vim/plugins/gitgutter.vim
source ~/.config/vim/plugins/jq.vim
source ~/.config/vim/plugins/indentline.vim
source ~/.config/vim/plugins/jsonc.vim
source ~/.config/vim/plugins/jqplay.vim
source ~/.config/vim/plugins/kitty.vim
source ~/.config/vim/plugins/incsearch.vim

call plug#end()

"--------------------------------------------------------------------------
" Miscellaneous
"--------------------------------------------------------------------------

"" Disables automatic commenting on newline
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"
"" Remove all trailing whitespace on save
"autocmd BufWritePre * %s/\s\+$//e
"
""devcontainer.json files contain comments, gah!
"autocmd BufNewFile,BufRead devcontainer.json set ft=jsonc
"
"" See https://github.com/neovim/neovim/issues/5559#issuecomment-258143499
"let g:is_bash = 1
"
"" Ignore markdown complaints about underscores
"" (see https://github.com/tpope/vim-markdown/issues/21)
"autocmd FileType markdown syn match markdownError "\w\@<=\w\@="
"
"
"" YAML help - will use installed `yamllint` via ALE, and
"" sets tab options appropriately, and also configures the
"" indentLine plugin - to start disabled, toggleable with <leader>i
"" and the concealcursor value is to address an issue with background
"" colours with cursorline.
"autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
"nnoremap <leader>i :IndentLinesToggle<CR>
"let g:indentLine_char = '┊'
"let g:indentLine_enabled = 0
"let g:indentLine_concealcursor = 0
"
"autocmd BufNewFile,BufRead /tmp/journal.* :autocmd TextChanged,TextChangedI <buffer> silent write
"
"augroup filetypes
"  au!
"  autocmd BufNewFile,BufRead Dockerfile* set filetype=dockerfile
"augroup END
