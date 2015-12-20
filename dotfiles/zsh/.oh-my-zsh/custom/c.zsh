c() {
  local previous=$PWD
  if [[ -d "$@" ]]; then
    cd "$@"
  elif [[ -f "$@" ]]; then
    cd $(dirname "$@")
  else
    fasd_cd -d "$@"
  fi

  if [[ $PWD != $previous ]]; then
    ls -a
  fi
}