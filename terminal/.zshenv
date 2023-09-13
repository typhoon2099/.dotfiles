if ! [[ "$PATH" =~ ":$HOME/.local/bin" ]]
then
  export PATH="$HOME/.local/bin:$PATH"
fi
. "$HOME/.cargo/env"

if [ "$XDG_CURRENT_DESKTOP" = "i3" ]; then
  export QT_QPA_PLATFORMTHEME="kde"
fi
