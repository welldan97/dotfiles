highlight() {
  sed "s/$@/$bg[yellow]$@$reset_color/"
}
