act() {
    local venvdir=".venv"
    if [[ -n "$1" ]]; then
        venvdir="$1"
    fi
    if [[ -d "$venvdir" ]] && [[ -e "$venvdir/bin/activate" ]]; then
        source "$venvdir/bin/activate"
        echo "Virtualenv '$(echo $VIRTUAL_ENV | sed "s;^$HOME;~;")' has been activated"
        echo "$(python --version) ($(which python | sed "s;^$HOME;~;"))"
    else
        echo "There's no virtualenv in '$venvdir' folder"
    fi
}

dea() {
    if [[ -z $VIRTUAL_ENV ]]; then
        echo "No virtualenv has been activated" && false
        return
    fi
    local venv="$(echo $VIRTUAL_ENV | sed "s;^$HOME;~;")"
    deactivate
    echo "Virtualenv '$venv' has been deactivated"
}

jupyterlab() {
    if [[ -z $VIRTUAL_ENV ]]; then
        act
    fi
    jupyter lab --ip $(hostname -I) --no-browser
}
