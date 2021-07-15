Plug 'puremourning/vimspector', { 'on': '<Plug>VimspectorContinue' }

let g:vimspector_install_gadgets = ['debugpy']

nmap <silent> <Leader>dc <Plug>VimspectorContinue
nmap <silent> <Leader>dq <Plug>VimspectorStop
nmap <silent> <Leader>db <Plug>VimspectorToggleBreakpoint
nmap <silent> <Leader>dn <Plug>VimspectorStepOver
nmap <silent> <Leader>ds <Plug>VimspectorStepInto
nmap <silent> <Leader>df <Plug>VimspectorStepOut
nmap <silent> <Leader>di <Plug>VimspectorBalloonEval
xmap <silent> <Leader>di <Plug>VimspectorBalloonEval

let s:mapped = {}

function! s:set_debug_keymaps() abort
    if has_key(s:mapped, string(bufnr()))
        return
    endif

    " nmap <silent> <buffer> c <Plug>VimspectorContinue
    " nmap <silent> <buffer> q <Plug>VimspectorStop
    " nmap <silent> <buffer> b <Plug>VimspectorToggleBreakpoint
    nmap <silent> <buffer> m <Plug>VimspectorStepOver
    " nmap <silent> <buffer> s <Plug>VimspectorStepInto
    " nmap <silent> <buffer> f <Plug>VimspectorStepOut
    " nmap <silent> <buffer> i <Plug>VimspectorBalloonEval
    " xmap <silent> <buffer> i <Plug>VimspectorBalloonEval

    let s:mapped[string(bufnr())] = {'modifiable': &modifiable}

    setlocal nomodifiable
endfunction

function! s:unset_debug_keymaps() abort
    let original_buf = bufnr()
    let hidden = &hidden

    try
        set hidden
        for bufnr in keys(s:mapped)
            try
                execute 'noautocmd buffer' bufnr
                " silent! nunmap <buffer> c
                " silent! nunmap <buffer> q
                " silent! nunmap <buffer> b
                silent! nunmap <buffer> m
                " silent! nunmap <buffer> s
                " silent! nunmap <buffer> f
                " silent! nunmap <buffer> i
                " silent! xunmap <buffer> i
                
                let &l:modifiable = s:mapped[bufnr]['modifiable']
            endtry
        endfor
    finally
        execute 'noautocmd buffer' original_buf
        let &hidden = hidden
    endtry

    let s:mapped = {}
endfunction

augroup CustomMappings
    au!
    autocmd User VimspectorJumpedToFrame call s:set_debug_keymaps()
    autocmd User VimspectorDebugEnded call s:unset_debug_keymaps()
augroup end
