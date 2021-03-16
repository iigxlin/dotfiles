#!/bin/bash

# install.sh

check_is_sudo() {
    if [ "$EUID" -ne 0 ]; then
        echo "Please run as root."
        exit
    fi
}

usage() {
    echo "Usage: sudo bash install.sh [OPTION]"
    echo "  dotfiles - link all dotfiles"
    echo "  all - install all things listed above"
}

get_dotfiles() {
    # create subshell
    (
    echo "--------- Get Dotfiles Now ---------"


    cd "$HOME"

    rm -rf .vimrc .tmux.conf .bashrc .zshrc .i3/config .emacs.d/init.el .gitconfig
    ln -s ~/.dotfiles/.tmux.conf .tmux.conf
    ln -s ~/.dotfiles/.bashrc .bashrc
    ln -s ~/.dotfiles/.zshrc .zshrc
    ln -s ~/.dotfiles/.emacs.d/init.el .emacs.d/init.el
    ln -s ~/.dotfiles/.i3/config .i3/config
    ln -s ~/.dotfiles/.gitconfig .gitconfig
    echo "source ~/.dotfiles/.vim/init.vim" > ~/.vimrc
    )
}

main() {
    local cmd=$1

    if [[ -z "$cmd" ]]; then
        usage
        exit 1
    fi

    check_is_sudo

    if [[ $cmd == all ]]; then
        get_dotfiles
    fi
}

main "$@"
