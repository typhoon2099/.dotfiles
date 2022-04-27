source ~/.bash_aliases

LOCAL_CONFIG=~/.local_config.zsh
if [[ -f "$LOCAL_CONFIG" ]]; then
    source "$LOCAL_CONFIG"
fi

autoload -Uz compinit && compinit && compinit

eval "$(starship init zsh)"
