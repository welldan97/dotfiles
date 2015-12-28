c() {
  local previous=$PWD
  if [ -d "$@" ]; then
    cd "$@"
  elif [ -f "$@" ]; then
    cd "$(dirname "$@")"
    local file="$(basename "$@")"
  else
    fasd_cd -d "$@"
  fi

  if [ "$PWD" != "$previous" ]; then
    if [ ! -z "$file" ]; then
      echo "$(script -q /dev/null ls -aG . | highlight "$file" | cat)"
    else
      ls -a
    fi
  fi
}
