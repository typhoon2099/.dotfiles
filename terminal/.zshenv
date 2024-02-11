typeset -U path PATH
path+=("$HOME/.local/bin")
. "$HOME/.cargo/env"

if [ "$XDG_CURRENT_DESKTOP" = "i3" ]; then
  export QT_QPA_PLATFORMTHEME="kde"
fi
