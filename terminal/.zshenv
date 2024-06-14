typeset -U path PATH
path+=("$HOME/.local/bin")
. "$HOME/.cargo/env"

if [ "$XDG_CURRENT_DESKTOP" = "i3" ]; then
  export XDG_CURRENT_DESKTOP="KDE"
  export XDG_SESSION_DESKTOP="KDE"
  export XDG_MENU_PREFIX="plasma-"
fi
