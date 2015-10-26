class people::welldan97::dotosx {
  $sha = 'd6598592e36b150335145d13fad5852a69409c71'
  $url = "https://raw.githubusercontent.com/mathiasbynens/dotfiles/${sha}/.osx"
  $osx_done_path = "${people::welldan97::config::home}/.osx"

  exec {'run .osx':
    command => "sh -c \"\$(curl -fsSL ${url}) && touch ${osx_done_path}\"",
    creates => $osx_done_path
  }
}
