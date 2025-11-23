# -----------------
# Zsh configuration
# -----------------
ZSH_CACHE_DIR="$HOME/.cache/zsh"
ZIM_HOME="$ZSH_CACHE_DIR/zim"
ZIM_CONFIG_FILE="$HOME/.config/zimfw/zimrc.zsh"
ZIM_CONFIG="${ZIM_CONFIG_FILE:h}"

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

# to use zimfw without git
zstyle ':zim:zmodule' use 'degit'

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
alias la='eza --group-directories-first --icons --git -lag'
alias lg='lazygit'
alias ls='eza --group-directories-first --icons -1'
alias py='python3'
alias rm='rm --preserve-root'
alias wget='wget -c '

# Functions
mkcd() {
    [[ -n "${1}" ]] && mkdir -p "${1}" && builtin cd "${1}"
}

_ZO_FZF_SHARED=" \
--no-sort \
--bind=ctrl-z:ignore,btab:up,tab:down \
--cycle \
--keep-right \
--layout=reverse \
--tabstop=1 \
--exit-0 \
--info=inline \
--border=rounded \
--select-1 \
"
# zoxide
export _ZO_FZF_OPTS="--height=30% $_ZO_FZF_SHARED"
unset _ZO_FZF_SHARED

# zsh-fzf-history-search
export ZSH_FZF_HISTORY_SEARCH_FZF_ARGS="$_ZO_FZF_OPTS"
export ZSH_FZF_HISTORY_SEARCH_EVENT_NUMBERS=0
export ZSH_FZF_HISTORY_SEARCH_DATES_IN_SEARCH=0

# Other initialization
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
