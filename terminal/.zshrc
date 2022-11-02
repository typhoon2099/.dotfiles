source ~/.bash_aliases

LOCAL_CONFIG=~/.zshrc_local
if [[ -f "$LOCAL_CONFIG" ]]; then
    source "$LOCAL_CONFIG"
fi

autoload -Uz compinit && compinit && compinit

eval "$(starship init zsh)"
