xip-io-link() {
  if [[ -n "$1" ]]
  then
    subdomain=$1.
  else
    subdomain=
  fi
  echo http://$subdomain$(my-internal-ip).xip.io/
}

xip-io-qr() {
  if [[ -n "$1" ]]
  then
    suffix=-$1
  else
    suffix=
  fi
  qr_path=$TMPDIR"xip-io$suffix.png"
  echo $qr_path
  qrencode -s 7 -o $qr_path $(xip-io-link $1)
  open $qr_path
}
