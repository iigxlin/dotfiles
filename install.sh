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

    read -r -p "It will remove the .dotfiles folder if it exists and overwrite all dotfiles. Are you sure? [y/N] " response
    response=${response,,} # tolower
    if [[ "$response" =~ ^(yes|y)$ ]]; then

        cd "$HOME"
        rm -rf .dotfiles
        git clone https://github.com/humpylin/dotfiles .dotfiles

        rm -rf .vimrc .tmux.conf .bashrc .zshrc
        ln -s .dotfiles/.vimrc .vimrc
        ln -s .dotfiles/.tmux.conf .tmux.conf
        ln -s .dotfiles/.bashrc .bashrc
        ln -s .dotfiles/.zshrc .zshrc
    fi
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
