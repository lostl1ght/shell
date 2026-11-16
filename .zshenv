if [ -d "$HOME/.local/musl-cross/x86_64-linux-musl/bin" ]; then
    PATH="$HOME/.local/musl-cross/x86_64-linux-musl/bin:$PATH"
fi

if [ -d "$HOME/.local/musl-cross/aarch64-linux-musl/bin" ]; then
    PATH="$HOME/.local/musl-cross/aarch64-linux-musl/bin:$PATH"
fi

if [ -d "$HOME/.opencode/bin" ]; then
    PATH="$HOME/.opencode/bin:$PATH"
fi

if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    if [ -s "$NVM_DIR/nvm.sh" ]; then
        source "$NVM_DIR/nvm.sh"
    fi

fi

if [ -d "$HOME/.juliaup/bin" ]; then
    PATH="$HOME/.juliaup/bin:$PATH"
fi

if [ -s "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

if [ -d "$HOME/.npm-global/bin" ]; then
     PATH="$HOME/.npm-global/bin:$PATH"
fi

if [ -d "$HOME/.local/share/bob/nvim-bin" ]; then
    PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
fi

if command -v go >/dev/null 2>&1; then
    export GOPATH="$HOME/.local/share/go"
     PATH="$GOPATH/bin:$PATH"
elif [ -d "$HOME/.local/go" ]; then
    export GOPATH="$HOME/.local/share/go"
    export GOROOT="$HOME/.local/go"
    PATH="$GOROOT/bin:$GOPATH/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

typeset -U PATH
export PATH

# Bat as man pager
# if [ "$(which bat)" ]; then
#     export MANPAGER="sh -c 'col -bx | bat -l man -p'"
#     export MANROFFOPT="-c"
# fi

# Editor variables
if command -v nvim >/dev/null 2>&1; then
    export EDITOR="$(command -v nvim)"
    export VISUAL="$EDITOR"
    export MANPAGER="$EDITOR +Man!"
fi

# Less options
export PAGER="$(command -v less)"
export LESS="--mouse --wheel-lines=3 -R -M -S"
export SYSTEMD_PAGER="$PAGER"
export SYSTEMD_LESS="$LESS"

# Ssh agent
# export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# x410 with WSL
if [ "$(uname -r | grep "WSL" )" ]; then
    # TCP
    # export DISPLAY="$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0"
    # export DISPLAY=$(ip route | grep default | awk '{print $3; exit;}'):0.0

    # VSOCK
    export DISPLAY=':0.0'

    export GDK_BACKEND='x11'

    export BROWSER='firefox.exe'
fi

# Disable global compinit that conflicts with zimfw on ubuntu or suse
if [ "$(grep -e 'ID.*=.*ubuntu\|ID.*=.*opensuse' /etc/os-release)" ]; then
    skip_global_compinit=1
fi
