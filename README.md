<h1 align="center">Dotfiles ~/</h1>

This repo is a collection of dotfiles (configuration files) of the utilities that I use on a daily basis.
I use it in a Arch Linux system with a tiling window manager.

I am inspired by [Luke Smith](https://github.com/LukeSmithxyz), [Antonio Sarosi](https://github.com/antoniosarosi), and [Christian Chiarulli](https://github.com/ChristianChiarulli) dotfiles among others.

I am using [GNU Stow](https://www.gnu.org/software/stow/) as symlink farm manager.

## Install

1. Clone to your home directory `git clone git@github.com:Juanal07/dotfiles.git`

2. Go to the folder `cd dotfiles`

3. Make sure you have deleted the old dotfiles, for example: ~/.config/nvim

4. Symlink a folder `stow nvim` (by default the root is the parent directory)

5. Symlink a folder to specific root `stow -t /etc logitech`

## Some tools that I use

- [Zsh](https://github.com/zsh-users/zsh) - A shell designed for interactive use, although it is also a powerful scripting language.
- [tmux](https://github.com/tmux/tmux) - A terminal multiplexer.
- [Neovim](https://github.com/neovim/neovim) - Hyperextensible Vim-based text editor.
- [Git](https://github.com/git/git) - A free and open source distributed version control system.
- [Rofi](https://github.com/davatorium/rofi) - A window switcher, application launcher and dmenu replacement.
- [picom](https://github.com/yshui/picom) - A lightweight compositor for X11.
- [Dunst](https://github.com/dunst-project/dunst) - A highly configurable and lightweight notification daemon.

## Extra tools

I use [suckless software](https://suckless.org/) (dwm, dwmblocks, and st) which doesn't have dotfiles, the config files are in the source code.
You can find mine here:
[dwm](https://github.com/Juanal07/dwm), [dwmblocks](https://github.com/Juanal07/dwmblocks), and st.

## Setup

Linux: `stow -v alacritty bin dunst fontconfig git gtk-3.0 kitty lf logitech mpv nvim picom rofi shell systemd tmux x11 xscreensaver zathura zprofile zsh`
Linux target root: `sudo stow -v -t / udev logitech`

Mac: `stow -v alacritty bin git-mac karabiner kitty lf nvim shell skhd tmux yabai zprofile zsh`
