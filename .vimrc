set nocompatible
set number 
syntax on
set encoding=utf-8
set t_Co=256
set showcmd
filetype indent on

set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

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

set autoread

set wildmenu
set wildmode=longest:list,full

set backspace=indent,eol,start

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
Plug 'Valloric/YouCompleteMe', {'do': 'python3 ./install.py --clang-completer'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'scrooloose/nerdtree'
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
call plug#end()

" Plugin config
let g:ycm_extra_conf_globlist = ['~/dev/*','!~/*']
colorscheme molokai
let g:airline='molokai'
let g:airline#extensions#tabline#enabled = 1
map <C-n> :NERDTreeToggle<CR>
