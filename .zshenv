# PATH setup
if [[ "$(which ruby >/dev/null 2>/dev/null)" ]]; then
    export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
    export PATH="$GEM_HOME/bin:$PATH"
fi

if [[ -x "$HOME/.deno/bin/deno" ]]; then
    export DENO_INSTALL="$HOME/.deno"
    export PATH="$DENO_INSTALL/bin:$PATH"
fi

if [[ "$(which rustup >/dev/null 2>/dev/null)" ]] || [[ -x "$HOME/.cargo/bin/cargo" ]]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

if [[ -d "$HOME/.npm-global/bin" ]]; then
    export PATH="$HOME/.npm-global/bin:$PATH"
fi

if [[ -d "$HOME/.local/share/bob/nvim-bin" ]]; then
    export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
fi

if [[ -d "$HOME/.local/go" ]]; then
    export GOROOT="$HOME/.local/go"
    export GOPATH="$HOME/.local/share/go"
    export PATH="$GOROOT/bin:$PATH"
fi

if [[ -d "$HOME/.local/bin" ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

if [[ -d "$HOME/.pyenv" ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

typeset -U PATH

# Bat as man pager
if [[ "$(which bat)" ]]; then
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    export MANROFFOPT="-c"
fi

# Editor variables
if [[ "$(which nvim)" ]]; then
    export EDITOR="$(which nvim)"
    export VISUAL="$EDITOR"
fi

# Less options
# export LESS="--mouse --wheel-lines=3 -R"

# Ssh agent
# export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# x410 with WSL
if [[ "$(uname -r | grep "WSL" )" ]]; then
    # TCP
    # export DISPLAY="$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0"
    # export DISPLAY=$(ip route | grep default | awk '{print $3; exit;}'):0.0

    # VSOCK
    export DISPLAY=':0.0'

    export GDK_BACKEND="x11"
fi
