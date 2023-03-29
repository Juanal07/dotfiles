#!/bin/zsh

# zprofile file. Runs on login. Environmental variables are set here.

# Adds `~/.local/bin` and `~/.local/bin` to $PATH
export PATH="$PATH:${$(find ~/dotfiles/bin/.local/bin -type d -printf %p:)%%:}"

# Adds cargo commands to $PATH
source "/home/juan/.local/share/cargo/env"

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave"

# Needed for gpg password sign
export GPG_TTY=$TTY

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export BAT_THEME="gruvbox-dark"
export ALSA_CONFIG_PATH="$XDG_CONFIG_HOME/alsa/asoundrc"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"

# Run startx with all the startup scripts
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"
