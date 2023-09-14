ALIASES=~/.bash_aliases
if [[ -f "$ALIASES" ]]; then
    source "$ALIASES"
fi

alias ll="ls -lia"
alias vi="nvim"
alias vim="nvim"
alias fixup="git rebase --autosquash -i"

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

# ZSH Autosuggestions
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#A06D7E"

# Use GPG for SSH
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=1"

LOCAL_CONFIG=~/.local.zshrc
if [[ -f "$LOCAL_CONFIG" ]]; then
    source "$LOCAL_CONFIG"
fi

# Start completion
autoload -Uz compinit && compinit

# Initialise tools
eval "$(direnv hook zsh)"

# Initialise RTX cli
eval "$(rtx activate zsh)"
eval "$(rtx completion zsh)"

eval "$(starship init zsh)"

typeset -U path PATH
