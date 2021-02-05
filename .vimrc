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

set hidden

set completeopt=menu,menuone

" MacVim

if has("gui_running")
    if has("gui_macvim")
        set guifont=Monaco:h16
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
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/asyncrun.vim'
Plug 'Yggdroot/LeaderF', {'do': './install.sh'}
Plug 'dense-analysis/ale'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-unimpaired'
Plug 'godlygeek/tabular'
Plug 'ledger/vim-ledger', {'for': 'ledger'}
Plug 'puremourning/vimspector'
Plug 'nathangrigg/vim-beancount', {'for': 'beancount'}
call plug#end()

" Plugin config

let g:airline#extensions#tabline#enabled = 1
map <C-n> :NERDTreeToggle<CR>

" YouCompleteMe
let g:ycm_server_log_level = 'info'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings = 1

let g:ycm_filetype_whilelist = {
                        \ "c": 1, "cpp": 1, "sh": 1, "zsh": 1,
                        \ "python": 1,
                        \ }

" vim-gutentags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args = ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args = ['--c-kinds=+px']

" asyncrun.vim
let g:asyncrun_open = 6 " the number of lines of quickfix window
let g:asyncrun_bell = 1 " the bell rings when the task is done
" use f10 to open/close asyncrun quickfix window
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" LeaderF
" " Show icons, icons are shown by default
let g:Lf_ShowDevIcons = 1
" For GUI vim, the icon font can be specify like this, for example
let g:Lf_DevIconsFont = "DejaVuSansMono Nerd Font Mono"
let g:Lf_WindowPosition = 'popup'
let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']

" ALE
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta

" Vimspector
let g:vimspector_enable_mappings = 'HUMAN'
