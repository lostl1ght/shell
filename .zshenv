if [[ -d "$HOME/.juliaup/bin" ]]; then
    export PATH="$HOME/.juliaup/bin:$PATH"
fi

# PATH setup
if [[ -x "$HOME/.deno/bin/deno" ]]; then
    export DENO_INSTALL="$HOME/.deno"
    export PATH="$DENO_INSTALL/bin:$PATH"
fi

if [[ -x "$HOME/.cargo/bin/cargo" ]]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

if [[ -d "$HOME/.npm-global/bin" ]]; then
    export PATH="$HOME/.npm-global/bin:$PATH"
fi

if [[ -d "$HOME/.local/share/bob/nvim-bin" ]]; then
    export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
fi

if [[ $(which go) ]]; then
    export GOPATH="$HOME/.local/share/go"
    export PATH="$GOPATH/bin:$PATH"
    if [[ -d "$HOME/.local/go" ]]; then
        export GOROOT="$HOME/.local/go"
        export PATH="$GOROOT/bin:$PATH"
    fi
fi

if [[ -d "$HOME/.local/bin" ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

typeset -U PATH

# Bat as man pager
# if [[ "$(which bat)" ]]; then
#     export MANPAGER="sh -c 'col -bx | bat -l man -p'"
#     export MANROFFOPT="-c"
# fi

# Editor variables
if [[ "$(which nvim)" ]]; then
    export EDITOR="$(which nvim)"
    export VISUAL="$EDITOR"
    export MANPAGER="$EDITOR +Man!"
fi

# Less options
export PAGER="$(which less)"
export LESS="--mouse --wheel-lines=3 -R -M -S"
export SYSTEMD_PAGER="$PAGER"
export SYSTEMD_LESS="$LESS"

# Ssh agent
# export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# x410 with WSL
if [[ "$(uname -r | grep "WSL" )" ]]; then
    # TCP
    # export DISPLAY="$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0"
    # export DISPLAY=$(ip route | grep default | awk '{print $3; exit;}'):0.0

    # VSOCK
    export DISPLAY=':0.0'

    export GDK_BACKEND='x11'

    export BROWSER='firefox.exe'
fi

# Disable global compinit that conflicts with zimfw on ubuntu or suse
if [[ "$(grep -e 'ID.*=.*ubuntu\|ID.*=.*opensuse' /etc/os-release)" ]]; then
    skip_global_compinit=1
fi
