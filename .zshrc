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
[[ -s /usr/share/autojump/autojump.zsh ]] && . /usr/share/autojump/autojump.zsh

# proxy
export http_proxy=http://127.0.0.1:1080
export https_proxy=http://127.0.0.1:1080

# alias
if grep -q Microsoft /proc/version; then
    alias psh='powershell.exe'
    alias expl='explorer.exe'
fi

# Rust
[ -d "$HOME/.cargo/bin" ] && export PATH="$HOME/.cargo/bin:$PATH"
