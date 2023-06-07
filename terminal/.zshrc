source ~/.bash_aliases

LOCAL_CONFIG=~/.local.zshrc
if [[ -f "$LOCAL_CONFIG" ]]; then
    source "$LOCAL_CONFIG"
fi

autoload -Uz compinit && compinit && compinit

# Escape pasted URLs
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

bindkey " " magic-space

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# Initialise tools
eval "$(direnv hook zsh)"
eval "$(rtx activate zsh)"
eval "$(starship init zsh)"
