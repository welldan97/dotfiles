class people::welldan97::dotfiles {
  $dotfiles_dir = "${boxen::config::srcdir}/dotfiles"

  repository { $dotfiles_dir:
    source => "${::github_user}/dotfiles"
  }

  exec { "install dotfiles":
    cwd      => $dotfiles_dir,
    command  => "./install",
    provider => shell,
    creates  => "${people::welldan97::config::home}/.dotfiles",
    environment => [
      "DOTFILES_REAL_NAME=${::github_name}",
      "DOTFILES_EMAIL=${::github_email}",
      "HOME=${people::welldan97::config::home}"

    ],
    require  => [
      Repository["${people::welldan97::config::home}/.emacs.d"],
      Repository[$dotfiles_dir],
      Exec['install oh-my-zsh'],
      File["${people::welldan97::config::home}/.gitconfig"]
    ]
  }

}
