unlock-pdf() {
    gs -sOutputFile=$1.unlocked -sDEVICE=pdfwrite -dNOPAUSE -dbatch -q $1 </dev/null >/dev/null
    mv -f $1.unlocked $1
}
