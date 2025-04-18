ALIASES=~/.bash_aliases
if [[ -f "$ALIASES" ]]; then
    source "$ALIASES"
fi

alias ll="ls -lia"
alias vi="nvim"
alias vim="nvim"
alias fixup="git rebase -i origin/HEAD"
alias session="tmux list-sessions -F \"#{session_name}\" -f \"#{session_attached}\""

wt() {
  git fetch
  git worktree add -b $(session) $(session) origin/HEAD --no-track
  cd $(session)
}

gb() {
  git fetch
  git checkout -b $(session) origin/HEAD --no-track
}

# Escape pasted URLs
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

bindkey -e
bindkey " " magic-space

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# ZSH Autosuggestions
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#d06f8f"

export EDITOR=nvim

LOCAL_CONFIG=~/.local.zshrc
if [[ -f "$LOCAL_CONFIG" ]]; then
    source "$LOCAL_CONFIG"
fi

# Use GPG for SSH
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# Start completion
autoload -Uz compinit bashcompinit
compinit
bashcompinit

# Initialise Mise cli
eval "$(mise activate zsh)"
eval "$(mise completion zsh)"

eval "$(starship init zsh)"
