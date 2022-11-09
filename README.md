# dotfiles

This repo consists of several colections of dotfiles to be applied to a unix
environment using stow (you can try other ways, but stow is how it was designed
to be done). Below is a list of each collection along with a description of what
it's for, what software it aplies to, what other software may need to be
installed alongside it, and any other notes regarding it

## git

Contains a set of sensible defaults for git workflows. It doesn't contain user
name, email or signing key, they should be added to `~/.gitconfig_local`, to
avoid it being commited

### Required Software

- Git
- Neovim (for diff managing)

## i3

Config for i3-wm and i3-statusbar. Still a work in progress

### Required Software

* i3-wm
* i3status
* feh
* nm-applet (for managing network connections)
* pactl (to control audio volume)
* brightnessctl (for brightness control buttons)
* playerctl (for media control buttons)

### TODO

* Power management
* Status bar options (what to display etc)
* Status bar emoji
* Cycle workspaces
* Fix KDE/Gnome theming
* Bluetooth management (maybe? Or just use command line)
* Add ~/.fehbg script (after making more generic visa vi file names)
* Prevent over-amplification for volume (don't allow > 100%)

## macos

Keybindings to make Mac OS more consistent with unix environments (though it
depends on individual software support).

Note: You need to copy/paste the file to ensure that applications can pick it up
properly (symlinking as per stow doesn't seem to work reliably).

iTerm2 profile to import and use. For iTerm Modifiers should be remapped as
such:

- Control -> Right Command
- Left Command -> Control
- Right Command -> Left Command

Brewfile to get up and running on MacOS quickly.

## neovim

Text editor with lots of plugins for software development. A number of languages
have been configured (Rust, Ruby, Svelte) using a number of plugins, all of
which are manage by Plug Vim.

### Required Software

* Neovim (0.5+)
* Plug Vim
* rust-analyzer (nightly)
* svelte-language-server (and thus node)
* lua-language-server
* vscode-langservers-extracted
* emmet-ls
* Solargraph
* terraformls
* tflint
* fd
* RipGrep
* typescript
* typescript-language-server

### TODO
* Vim emmet
* Vim CSS autocomplete
* Vim ESLint
* Vim Stylelint
* vim-commentary
* vim-rails
* vim-surround/vim-sandwich

## terminal

Configs for bash, zsh, Starship, and xterm. Local zsh config can be added to
`~/.zshrc_local`. Bash config is mostly just some aliases. The xterm config is
currently just some colour settings, and is still a work in progress.

### Required Software

* bash/zsh
* Starship

## tmux

TMux config.

## Scripts to consider adding
* .xprofile (sets KDE styling)

* install script (Nix? Ansible?)
* Unify colours across everything (X11 colours?)
