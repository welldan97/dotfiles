public-config-fetch() {
  cat $DOTFILES_DIR/configuration/env/public.json | jq '.["'"$1"'"]' | sed 's/"//g'
}

export EMACS_CLIENT_PATH=$(public-config-fetch EMACS_CLIENT_PATH)
