Plug 'jpalardy/vim-slime', {
            \'on': [
                \'<Plug>SlimeRegionSend', 
                \'<Plug>SlimeParagraphSend',
                \'<Plug>SlimeConfig'
                \]
            \}

let g:slime_no_mappings = 1

xmap <c-c><c-c> <Plug>SlimeRegionSend
nmap <c-c><c-c> <Plug>SlimeParagraphSend
nmap <c-c>v     <Plug>SlimeConfig

let g:slime_target = 'tmux'
