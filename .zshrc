# -----------------
# Zsh configuration
# -----------------
ZSH_CACHE_DIR="$HOME/.cache/zsh"
ZIM_CONFIG="$HOME/.config/zimfw"

# History
setopt HIST_IGNORE_ALL_DUPS

# Input/output
bindkey -e

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# Set window title
precmd () {
    print -Pn "\e]0;%~\a"
}
ssh() {
    print -Pn "\e]0;[$1]\a"
    command ssh $@
}

# --------------------
# Module configuration
# --------------------

# git
zstyle ':zim:git' aliases-prefix 'g'

# input
zstyle ':zim:input' double-dot-expand yes

# zsh-autosuggestions
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# zim completion
zstyle ':zim:completion' dumpfile "${ZSH_CACHE_DIR}/zcompdump"
zstyle ':completion::complete:*' cache-path "${ZSH_CACHE_DIR}/zcompcache"

# ------------------
# Initialize modules
# ------------------
source "$ZIM_CONFIG/init.zsh"

# ------------------------------
# Post-init module configuration
# ------------------------------

# Aliases
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias chmod='chmod --preserve-root -v'
alias chown='chown --preserve-root -v'
alias df='df -h'
alias du='du -h'
alias hw='hwinfo --short'
alias ip='ip --color=auto'
alias la='eza --group-directories-first --icons --git -lahg'
alias lzd='sudo lazydocker'
alias lg='lazygit'
alias ls='eza --group-directories-first --icons -1'
alias py='python3'
alias rm='rm --preserve-root'
alias sudo="sudo --preserve-env='PAGER,LESS,SYSTEMD_PAGER,SYSTEMD_LESS'"
alias wget='wget -c '

# Functions
backup() {
    cp -r "$1" "$1.bak"
}

mkcd() {
    [[ -n "${1}" ]] && mkdir -p "${1}" && builtin cd "${1}"
}

tarnow() {
    tar cfa "$1.tar.gz" "$1"
}

untar() {
    tar xfa "$1"
}

winip() {
    local all
    if [[ "$1" == 'a' ]]; then
        all='/all'
    fi
    powershell.exe -c ipconfig "$all"
}

# Other initialization
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
