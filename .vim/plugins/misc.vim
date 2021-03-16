Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}

map <C-n> :NERDTreeToggle<CR>

Plug 'skywind3000/asyncrun.vim'

let g:asyncrun_open = 6 " the number of lines of quickfix window
let g:asyncrun_bell = 1 " the bell rings when the task is done
" use f10 to open/close asyncrun quickfix window
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

Plug 'puremourning/vimspector'

let g:vimspector_enable_mappings = 'HUMAN'

Plug 'mhinz/vim-signify'
Plug 'tpope/vim-unimpaired'
Plug 'godlygeek/tabular'
Plug 'ledger/vim-ledger', {'for': 'ledger'}
