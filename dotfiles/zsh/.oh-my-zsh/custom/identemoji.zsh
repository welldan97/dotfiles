identemoji() {
  display_emoji | sed "$(identemoji-get-emoji-number $1)"'!d' | cut -d' ' -f1
}

identemoji-get-emoji-number() {
  expr $(identemoji-to-decimal $(identemoji-make-hash $1)) % $(identemoji-emojis-count) + 1
}

identemoji-make-hash() {
  echo "$1" | md5 | cut -c1-4
}

identemoji-to-decimal() {
  echo "ibase=16; $(echo $1 | awk '{print toupper($0)}')" | bc
}

identemoji-emojis-count() {
  expr $(display_emoji | wc -l | sed -e 's/^[ \t]*//') - 1
}
