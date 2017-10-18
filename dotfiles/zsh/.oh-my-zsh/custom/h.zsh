h() {
  googler -c com -l en -j "$@"
  googler -c com -l en -n 5 "$@"
}
