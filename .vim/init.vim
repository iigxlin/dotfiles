" General Config

set nocompatible
set number 
set backspace=indent,eol,start
syntax on
set encoding=utf-8
set t_Co=256
set showcmd
set autoread
set mouse=a
filetype indent on
set modeline
set textwidth=72
set formatoptions+=mB
set formatoptions-=t
set secure

set hidden

set completeopt=menu,menuone

if $COLORTERM is 'truecolor'
    set termguicolors
endif

" MacVim

if has("gui_running")
    if has("gui_macvim")
        set guifont=Monaco:h15
        set noimdisable
        set transparency=10
    endif
endif

if has("macunix")
endif

" Identation

set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

autocmd FileType html setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab

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

source ~/.dotfiles/.vim/plugins/init.vim

silent colorscheme onehalfdark

highlight Pmenu ctermbg=grey
set exrc
