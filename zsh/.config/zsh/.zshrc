# cd into typed directory
setopt autocd

# History
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${ZDOTDIR}/.zsh_history"

# Aliases
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

# Basic auto/tab complete:
autoload -U compinit
compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots) # Include hidden files.

# VIM MODE
# bindkey -v
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

# LF: Ctrl + o -> Open LF in the actual dir
lfcd () {
    tmp="$(mktemp)"
    lf-image -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Ctrl + e -> Edit command line in vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Prompt Powerlevel10k: To customize run `p10k configure` or edit $ZDOTDIR/.p10k.zsh. Install -> sudo pacman -S zsh-theme-powerlevel10k
powerlevel10k=/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ -f $powerlevel10k ]] && source $powerlevel10k
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh

# Autosuggestions, zsh-autosuggestions: install -> sudo pacman -S zsh-syntax-autosuggestions
autosuggestions=/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
if [[ -f $autosuggestions ]]; then
    source $autosuggestions
    # Ctrl + n -> Accept suggest
    bindkey '^n' autosuggest-accept
fi

# Syntax highlighting, fast-syntax-highlighting: install -> sudo pacman -S zsh-syntax-highlighting
syntax=/usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
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
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --preview "bat --theme=gruvbox-dark --style=numbers,changes --color=always {}"'

# Ctrl + r -> Last commands
function fzf-history() {
    local last_commands=$(fc -rln 1 | fzf)
    # eval $last_commands
    print -z -- $last_commands
}
bindkey -s '^r' 'fzf-history\n'

# Ctrl + f -> Goto and open file
function open_fzf() {
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
bindkey -s '^f' 'open_fzf\n'

# Ctrl + d -> Change to a directory selected with fzf
function cd_fzf() {
    local selected_dir=$(fd . ./ --type d --hidden --follow --exclude .git | fzf || true)
    if [ -n "$selected_dir" ]; then
        cd "$selected_dir"
    fi
}
bindkey -s '^d' 'cd_fzf\n'

function live_grep() {
    local file=$(rg --column --line-number --no-heading --color=always "$1" | fzf --ansi -m --reverse --phony --bind "change:reload:rg --column --line-number --no-heading --color=always {q} || true" | awk -F: '{print $1}')
    local line=$(echo "$file" | awk -F: '{print $2}')
    if [ -n "$file" ]; then
        nvim +$line "$file"
    fi
}
bindkey -s '^g' 'live_grep\n'
