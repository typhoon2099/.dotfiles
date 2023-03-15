alias ll="ls -lia"
alias vi="nvim"
alias vim="nvim"
alias gspp="git stash && git pull && git stash pop"
alias steam='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia steam'
alias fixup="git rebase --autosquash -i"
alias batdiff="git diff --name-only --relative --diff-filter=d | xargs bat --diff"

function git_mb() {
  if [ -z "$1" ]; then
    printf "%s\n" "Please provide a branch name"
  else
    git fetch
    git checkout -b $1 origin/master --no-track
  fi
}
