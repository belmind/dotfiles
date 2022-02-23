# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Current theme is pure by Sindre
ZSH_THEME="pure"
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# Navigation Aliases
# ----- REMOVED FROM GITHUB -----

# Configuration Aliases
alias zshrc="nvim ~/.zshrc"
alias vimrc="nvim ~/.vimrc"

# Git Aliases
alias gcs="git checkout develop"

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
