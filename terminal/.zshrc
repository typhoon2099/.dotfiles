source ~/.bash_aliases

LOCAL_CONFIG=~/.zshrc_local
if [[ -f "$LOCAL_CONFIG" ]]; then
    source "$LOCAL_CONFIG"
fi

autoload -Uz compinit && compinit && compinit

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt CORRECT_ALL

eval "$(starship init zsh)"
