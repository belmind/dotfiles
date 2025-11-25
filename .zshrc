# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="lambda-gitster"
# fpath+=$HOME/.zsh/pure
# autoload -U promptinit; promptinit
# prompt pure

# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-fzf-history-search)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# Navigation Aliases
# alias b="cd ~/backend/"

# Configuration Aliases
alias zshrc="nvim ~/.zshrc"
alias vimrc="nvim ~/.vimrc"


# Autocomplete
zstyle ':autocomplete:*' default-context history-incremental-search-backward

# VsCode
function code {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}

# History file
export HISTSIZE=10000000
export SAVEHIST=10000000
export HISTFILE="$HOME/.zhistory"

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

unsetopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# GPG
export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ "$TERM" == "xterm-kitty" ]] && alias ssh="kitty +kitten ssh"

# For macOS Terminal to auto-add ssh keys and redirect sdtout to /dev/null
eval "$(ssh-add --apple-use-keychain >/dev/null 2>&1)"

if [[ $#h -gt 0 ]]; then
zstyle :completion:*:ssh:* hosts \$h
zstyle :completion:*:slogin:* hosts \$h
fi

fpath=($fpath "/Users/bdervisevi/.zfunctions")
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

. "$HOME/.local/bin/env"
