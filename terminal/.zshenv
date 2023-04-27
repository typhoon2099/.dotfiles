export PATH="$HOME/.local/bin:$PATH"
. "$HOME/.cargo/env"

if [ "$XDG_CURRENT_DESKTOP" = "i3" ]; then
  export QT_QPA_PLATFORMTHEME="kde"
fi
