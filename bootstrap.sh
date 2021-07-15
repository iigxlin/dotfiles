#!/usr/bin/env bash

dotfiles_dir=$(cd -- "$(dirname ${BASH_SOURCE})" > /dev/null 2>&1; pwd -P)

ln -s $dotfiles_dir/.emacs.d $HOME/.emacs.d
ln -s $dotfiles_dir/.macos $HOME/.macos
ln -s $dotfiles_dir/.urlview $HOME/.urlview
