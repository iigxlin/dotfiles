" General Config

set nocompatible
set number 
set backspace=indent,eol,start
syntax on
set encoding=utf-8
set t_Co=256
set showcmd
set autoread
filetype indent on

set hidden

" MacVim

set guifont=Monaco:h16
set transparency=30

" Identation

set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

autocmd FileType html setlocal shiftwidth=2 softtabstop=2 expandtab

set wrap
"set nowrap
"set wrapmargin=4
set scrolloff=5
"set sidescrolloff=5
set laststatus=2
set ruler

set hlsearch
set incsearch
set ignorecase
set smartcase

" Completion

set wildmenu
set wildmode=longest:list,full
set wildignore=*.o,*.obj,*~
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif

" change default directory
let s:vim_swapfiles_dir = expand('~/.vim/.swp/')
if !isdirectory(s:vim_swapfiles_dir)
    silent! call mkdir(s:vim_swapfiles_dir, 'p')
endif
set directory=~/.vim/.swp//

" tags
set tags=./.tags;,.tags

" mapping
let mapleader=',' " change the key <leader>
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>d :bd<CR>

" Plugin
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe', {'do': 'python3 ./install.py --clangd-completer'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/vim-easy-align'
Plug 'skywind3000/asyncrun.vim'
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries', 'for': 'go'}
call plug#end()

" Plugin config
" let g:airline='molokai'
let g:airline#extensions#tabline#enabled = 1
map <C-n> :NERDTreeToggle<CR>
" YouCompleteMe
let g:ycm_extra_conf_globlist = ['~/dev/*', '!~/*']
let g:ycm_server_log_level = 'info'
" vim-gutentags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args = ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args = ['--c-kinds=+px']
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif
" asyncrun.vim
let g:asyncrun_open = 6 " the number of lines of quickfix window
let g:asyncrun_bell = 1 " the bell rings when the task is done
" use f10 to open/close asyncrun quickfix window
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

