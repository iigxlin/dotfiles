setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

export EDITOR=/usr/bin/vim

# zplug
if [ ! -d ~/.zplug ]; then
    echo 'Installing zplug ... '
    git clone git@github.com:zplug/zplug.git ~/.zplug
fi
source ~/.zplug/init.zsh 
zplug "plugins/git", from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "dracula/zsh", as:theme
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

# file
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# proxy
export http_proxy=http://127.0.0.1:1087
export https_proxy=http://127.0.0.1:1087
export all_proxy=socks5://127.0.0.1:1086

# System Specific
case `uname` in 
Darwin)
    alias vim='mvim -v'
    [ -f /usr/local/bin/mvim ] && export EDITOR='/usr/local/bin/mvim -v'
;;
Linux)
    # commands for Linux
;;
FreeBSD)
    # commands for FreeBSD
;;
esac
