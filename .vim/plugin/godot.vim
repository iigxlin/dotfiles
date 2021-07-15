if has('macunix')
    let g:godot_executable = '/Applications/Godot.app'
endif
if has('win32') || has('win32unix')
    let g:godot_executable = ''
endif

let g:ycm_language_server += [
            \ {
                \ 'name': 'godot',
                \ 'filetypes': ['gdscript'],
                \ 'project_root_files': ['project.godot'],
                \ 'port': 6008
                \ }
            \ ]

let g:Lf_RootMarkers += ['project.godot']

func! s:godot_settings() abort
    setlocal tabstop=4
    nnoremap <buffer> <leader>rl :GodotRunLast<CR>
    nnoremap <buffer> <leader>rc :GodotRunCurrent<CR>
    nnoremap <buffer> <leader>rr :GodotRun<CR>
endfunc

augroup godot | au!
    au FileType gdscript call s:godot_settings()
augroup end

call ale#linter#Define('gdscript', {
\   'name': 'godot',
\   'lsp': 'socket',
\   'address': '127.0.0.1:6008',
\   'project_root': 'project.godot',
\ })
