export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

if [ "$XDG_CURRENT_DESKTOP" = "i3" ]; then
  export QT_QPA_PLATFORMTHEME="kde"
fi
