Plug 'vimwiki/vimwiki'

let g:vimwiki_list = [{'path': '~/Documents/notes',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

au FileType vimwiki setlocal textwidth=72
