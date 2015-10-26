class people::welldan97::oh_my_zsh {
  exec {'install oh-my-zsh':
    command => "sh -c \"\$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)\"",
    creates => "${people::welldan97::config::home}/.oh-my-zsh",
    require  => Osx_Chsh[$::luser]
  }
}
