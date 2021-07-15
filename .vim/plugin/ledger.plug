Plug 'ledger/vim-ledger', {'for': 'ledger'}

let g:ledger_bin = 'ledger'
let g:ledger_align_at = 50
let g:ledger_commodity_before = 0

au FileType ledger call s:ledger_keymap()

function! s:ledger_keymap() abort
    noremap { ?^\d<CR>
    noremap } /^\d<CR>
    inoremap <silent> <Tab> <C-r>=ledger#autocomplete_and_align()<CR>
    vnoremap <silent> <Tab> :LedgerAlign<CR>
endfunction
