if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let s:plugins = split(expand('~/.dotfiles/.vim/plugins/*.plug'))
let s:settings = split(expand('~/.dotfiles/.vim/plugins/*.vim'))

function! s:load_plugins()
    for plugin in s:plugins
        exec "source " . plugin
    endfor
endfunction

function! s:load_settings()
    for setting in s:settings
        if setting !~ 'init.vim'
            exec "source " . setting
        endif
    endfor
endfunction

call plug#begin('~/.vim/plugged')
call s:load_plugins()
call plug#end()

call s:load_settings()
