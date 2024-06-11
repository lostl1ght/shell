if [[ "$(which rustup)" && ( ! -f "$ZSH_CACHE_DIR/completions/_rustup"  ||  ! -f "$ZSH_CACHE_DIR/completions/_cargo" ) ]]; then
rustup completions zsh >| "$ZSH_CACHE_DIR/completions/_rustup" &|
cat >| "$ZSH_CACHE_DIR/completions/_cargo" <<EOF
#compdef cargo
source "$(rustc +${${(z)$(rustup default)}[1]} --print sysroot)"/share/zsh/site-functions/_cargo
EOF
fi
fpath+="${0:A:h}/src"
