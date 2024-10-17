# cd into typed directory
setopt autocd

# History
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${ZDOTDIR}/.zsh_history"

# Alias
ALIASRC="${ZDOTDIR}/alias"
[ -f "${ALIASRC}" ] && source "${ALIASRC}"

# Basic auto/tab complete:
autoload -U compinit
compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots) # Include hidden files.

# VIM MODE
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q' ;;      # block
        viins|main) echo -ne '\e[5 q' ;; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Ctrl + o -> Open LF in the actual dir
function lfcd() {
    tmp="$(mktemp)"
    ~/.config/lf/lf-image.sh -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

# Ctrl + e -> Edit command line in vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

powerlevel10k=/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
autosuggestions=/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
syntax=/usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
if [ "$(uname)" = "Darwin" ]; then
    powerlevel10k=/opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
    autosuggestions=/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    syntax=/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Prompt Powerlevel10k: To customize run `p10k configure` or edit $ZDOTDIR/.p10k.zsh. Install -> sudo pacman -S zsh-theme-powerlevel10k
[[ -f $powerlevel10k ]] && source $powerlevel10k
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
# eval "$(starship init zsh)"

# Autosuggestions, zsh-autosuggestions: install -> sudo pacman -S zsh-syntax-autosuggestions
if [[ -f $autosuggestions ]]; then
    source $autosuggestions
    # Ctrl + n -> Accept suggest
    bindkey '^n' autosuggest-accept
fi

# Syntax highlighting, fast-syntax-highlighting: install -> sudo pacman -S zsh-syntax-highlighting
[[ -f $syntax ]] && source $syntax

# Sudo, sudo-plugin-zsh: install -> curl -sL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh -o $ZDOTDIR/.sudo.plugin.zsh
sudo=$ZDOTDIR/.sudo.plugin.zsh
if [[ -f $sudo ]]; then
    source $sudo
    # Ctrl + v -> Add sudo at the start
    bindkey -M vicmd '^V' sudo-command-line
    bindkey -M viins '^V' sudo-command-line
fi

# Fzf
export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border --preview "bat --style=numbers,changes --color=always {}"'

# Ctrl + f -> Goto and open file
function open_fzf_files() {
    local selected_file=$(fd . ./ --type f --hidden --follow --exclude .git | fzf)
    if [ -n "$selected_file" ]; then
        local file_extension=$(echo "$selected_file" | awk -F . '{print $NF}')
        case "$file_extension" in
            "txt" | "md" | "log" | "sh" | "conf" | "json" | "ts" | "js" | "jsx" | "tsx" | "py" | "rb" | "go" | "rs" | "lua" | "html" | "xml" | "yml" | "yaml" | "toml" | "ini")
                nvim "$selected_file"
                ;;
            "mp4" | "avi" | "mov" | "mkv")
                mpv "$selected_file"
                ;;
            "png" | "jpg" | "jpeg" | "gif")
                sxiv "$selected_file"
                ;;
            "pdf")
                zathura "$selected_file"
                ;;
            *)
                if [ -z "$file_extension" ] || [ "${selected_file:0:1}" = "." ]; then
                    nvim "$selected_file"
                else
                    xdg-open "$selected_file"

                fi
                ;;
        esac
    fi
}

# Ctrl + d -> Change to a directory selected with fzf
function cd_fzf() {
    local selected_dir=$(fd . ./ --type d --hidden --follow --exclude .git | fzf --preview 'eza --color=always --tree --level=2 {}' || true)
    if [ -n "$selected_dir" ]; then
        cd "$selected_dir"
    fi
}

function live_grep() {
    local file=$(rg --column --line-number --no-heading --color=always "$1" | fzf --ansi -m --reverse --phony --bind "change:reload:rg --column --line-number --no-heading --color=always {q} || true" | awk -F: '{print $1}')
    local line=$(echo "$file" | awk -F: '{print $2}')
    if [ -n "$file" ]; then
        nvim +$line "$file"
    fi
}

bindkey -s '^g' 'live_grep\n'
bindkey -s '^d' 'cd_fzf\n'
bindkey -s '^f' 'open_fzf_files\n'
bindkey -s '^b' 'pretty-diff-from-HEAD\n'
bindkey -s '^h' 'pretty-diff-from-diverged\n'
bindkey -s '^k' 'fzf-kill\n'
bindkey -s '^w' 'fzf-tmux-workspace\n'
bindkey -s '^t' 'fzf-useful-commands\n'
bindkey -s '^o' 'lfcd\n'

local color00='#32302f'
local color01='#3c3836'
local color02='#504945'
local color03='#665c54'
local color04='#bdae93'
local color05='#d5c4a1'
local color06='#ebdbb2'
local color07='#fbf1c7'
local color08='#fb4934'
local color09='#fe8019'
local color0A='#fabd2f'
local color0B='#b8bb26'
local color0C='#8ec07c'
local color0D='#83a598'
local color0E='#d3869b'
local color0F='#d65d0e'

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"\
" --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"\
" --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C"\
" --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"

 # macOS
if [ "$(uname)" = "Darwin" ]; then
	# NVM
	source $(brew --prefix nvm)/nvm.sh
fi

. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

# Created by `pipx` on 2024-09-24 19:57:53
export PATH="$PATH:/Users/jraya/dotfiles/bin/.local/bin"

# Turso
export PATH="$PATH:/home/juan/.turso"

# bun completions
[ -s "/Users/jraya/.bun/_bun" ] && source "/Users/jraya/.bun/_bun"
