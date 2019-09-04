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
    echo "  base - install base pkgs"
    echo "  dotfiles - get dotfiles from GitHub and set soft links"
    echo "  all - install all things listed above"
}

base_install() {
    echo "--------- Install Base Packages Now ---------"
    if command -v apt > /dev/null; then
	apt update
	apt upgrade
        apt install git \
            curl \
            cmake \
            build-essential \
            python3-dev \
            autojump \
            zsh
    fi
}

get_dotfiles() {
    # create subshell
    (
    echo "--------- Get Dotfiles Now ---------"

    read -r -p "It will remove the dotfiles folder if it exists and overwrite all dotfiles. Are you sure? [y/N] " response
    response=${response,,} # tolower
    if [[ "$response" =~ ^(yes|y)$ ]]; then

        cd "$HOME"
        rm -rf dotfiles
        git clone git@github.com:humpylin/dotfiles.git

        rm -rf .vimrc .tmux.conf .bashrc .zshrc .gitconfig
        ln -s dotfiles/.vimrc .vimrc
        ln -s dotfiles/.tmux.conf .tmux.conf
        ln -s dotfiles/.bashrc .bashrc
        ln -s dotfiles/.gitconfig .gitconfig
        ln -s dotfiles/.zshrc .zshrc
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
        base_install
        get_dotfiles
    fi
}

main "$@"
