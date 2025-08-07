# Pyenv
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"

# Postgres pg client library
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
