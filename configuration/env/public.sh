public-config-fetch() {
  cat "$DOTFILES_PATH/configuration/env/public.json" | jq '.["'"$1"'"]' | sed 's/"//g'
}

public-all-keys() {
  cat "$DOTFILES_PATH/configuration/env/public.json" |
    jq 'keys[]' |
    sed -e 's/"//g'
}

public-all-keys | while read -r key; do
  eval "export \"$key\""
  eval "$key=\"\$(public-config-fetch $key)\""
done
