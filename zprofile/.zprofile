#!/bin/zsh

# zprofile file. Runs on login. Environmental variables are set here.
if [ "$(uname)" = "Darwin" ]; then
    eval $(/opt/homebrew/bin/brew shellenv)

    PATH="$PATH:$(find ~/dotfiles/bin/.local/bin -type d -depth 1 | tr '\n' ':' | sed 's/:$//')"
    export PATH

    export EDITOR="nvim"
    # export TERMINAL="alacritty"
    # export BROWSER="google-chrome"

    export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
    export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
    export BAT_THEME="gruvbox-dark"

    # Color for mannual
    export LESS=-R
    export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
    export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
    export LESS_TERMCAP_me="$(printf '%b' '[0m')"
    export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
    export LESS_TERMCAP_se="$(printf '%b' '[0m')"
    export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
    export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
    export LESSOPEN="| /usr/bin/bat -O ansi %s 2>/dev/null"

    # Load Angular CLI autocompletion.
    # source <(ng completion script)
else
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
    export ALSA_CONFIG_PATH="$XDG_CONFIG_HOME/alsa/asoundrc"
    export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
    export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
    export BAT_THEME="gruvbox-dark"

    # Color for mannual
    export LESS=-R
    export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
    export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
    export LESS_TERMCAP_me="$(printf '%b' '[0m')"
    export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
    export LESS_TERMCAP_se="$(printf '%b' '[0m')"
    export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
    export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
    export LESSOPEN="| /usr/bin/bat -O ansi %s 2>/dev/null"

    export DISPLAY=:0
    export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

    # Run startx with all the startup scripts
    [ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"
fi
