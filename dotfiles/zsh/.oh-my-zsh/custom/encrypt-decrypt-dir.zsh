encrypt-dir() {
    tar -c $1 | openssl enc -aes-256-cbc -e > $1.tar.enc
}
decrypt-dir() {
    openssl aes-256-cbc -d -in $1 | tar -x
}

encrypt-and-hide () {
    cp $1/image.jpg $(dirname $1)/image.jpg &&
    encrypt-dir $1 &&
    zip archive.zip $1.tar.enc &&
    cat image.jpg archive.zip > $1.jpg &&
    rm $1.tar.enc image.jpg archive.zip
}

decrypt-hidden () {
    unzip $1
    decrypt-dir $(basename $1 .jpg).tar.enc &&
    rm $(basename $1 .jpg).tar.enc
}
