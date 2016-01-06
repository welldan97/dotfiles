public-config-fetch() {
  cat "$DOTFILES_PATH/configuration/env/public.json" | jq '.["'"$1"'"]' | sed 's/"//g'
}

export EMACS_PATH
export EMACS_CLIENT_PATH
export POSTGRES_APP_BIN_PATH

EMACS_PATH="$(public-config-fetch EMACS_PATH)"
EMACS_CLIENT_PATH="$(public-config-fetch EMACS_CLIENT_PATH)"
POSTGRES_APP_BIN_PATH="$(public-config-fetch POSTGRES_APP_BIN_PATH)"
