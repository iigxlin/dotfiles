setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

export EDITOR=/usr/bin/vim

# autojump
if [ ! -d /usr/share/autojump ]; then
    echo 'Installing autojump ... '
    sudo apt install autojump
fi
. /usr/share/autojump/autojump.zsh 

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

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# alias
if grep -q Microsoft /proc/version; then
    alias psh='powershell.exe'
    alias expl='explorer.exe'
fi

