danger-mode() {
  unset HISTFILE
  echo -e "\033]6;1;bg;red;brightness;255\a"
  echo -e "\033]Phffbbcc\033\\"
}
