" Reorg inspired by https://github.com/jessarcher/dotfiles
"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------
set encoding=utf-8
set expandtab
set shiftwidth=2
set tabstop=2
set hidden
set signcolumn=yes
set relativenumber
set number
set noundofile
set nospell
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set wrap
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
set conceallevel=2
set linebreak

"--------------------------------------------------------------------------
" Key mappings
"--------------------------------------------------------------------------
let mapleader = " "

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

source ~/.config/vim/plugins/ale.vim
source ~/.config/vim/plugins/fugitive.vim
source ~/.config/vim/plugins/fzf.vim
source ~/.config/vim/plugins/gitbranch.vim
source ~/.config/vim/plugins/gitgutter.vim
source ~/.config/vim/plugins/goyo-and-limelight.vim
source ~/.config/vim/plugins/incsearch.vim
source ~/.config/vim/plugins/indentline.vim
source ~/.config/vim/plugins/jq.vim
source ~/.config/vim/plugins/jqplay.vim
source ~/.config/vim/plugins/jsonc.vim
source ~/.config/vim/plugins/kitty.vim
source ~/.config/vim/plugins/lightline.vim
source ~/.config/vim/plugins/repeat.vim
source ~/.config/vim/plugins/surround.vim
source ~/.config/vim/plugins/unimpaired.vim
source ~/.config/vim/plugins/vimspector.vim
source ~/.config/vim/plugins/maximizer.vim

call plug#end()

"--------------------------------------------------------------------------
" Miscellaneous
"--------------------------------------------------------------------------

"devcontainer.json files contain comments, gah!
autocmd BufNewFile,BufRead devcontainer.json set ft=jsonc

" Ignore markdown complaints about underscores
" (see https://github.com/tpope/vim-markdown/issues/21)
autocmd FileType markdown syn match markdownError "\w\@<=\w\@="

autocmd BufNewFile,BufRead /tmp/journal.* :autocmd TextChanged,TextChangedI <buffer> silent write

augroup filetypes
  au!
  autocmd BufNewFile,BufRead Dockerfile* set filetype=dockerfile
augroup END

"--------------------------------------------------------------------------
" Appearance (experimental)
"--------------------------------------------------------------------------
highlight MatchParen ctermbg=240
highlight Search ctermbg=240
highlight Visual ctermbg=240
highlight LineNr ctermfg=107
highlight Statement ctermfg=99
highlight Comment cterm=italic
