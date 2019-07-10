export MY_VIRTUALENV=$HOME/.config/python/venvs/py3Bubba
export BIN_VIRTUALENV=/usr/local/bin/virtualenv


FOUND_PYENV=$+commands[pyenv]

if [[ $FOUND_PYENV -eq 1 ]]; then
    eval "$(pyenv init - zsh)"
    if (( $+commands[pyenv-virtualenv-init] )); then
        eval "$(pyenv virtualenv-init - zsh)"
    fi
    function pyenv_prompt_info() {
        echo "$(pyenv version-name)"
    }
else
    # fallback to system python
    function pyenv_prompt_info() {
        echo "system: $(python -V 2>&1 | cut -f 2 -d ' ')"
    }
fi

unset FOUND_PYENV
