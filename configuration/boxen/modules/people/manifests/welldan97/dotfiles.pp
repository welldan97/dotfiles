class people::welldan97::dotfiles {
  $dotfiles_dir = "${boxen::config::srcdir}/dotfiles"

  repository { $dotfiles_dir:
    source => "${::github_user}/dotfiles"
  }

  $dotfiles_install_script_path = './configuration/scripts/install-dotfiles'

  exec { "install dotfiles":
    cwd      => $dotfiles_dir,
    command  => $dotfiles_install_script_path,
    provider => shell,
    creates  => "${people::welldan97::config::home}/.dotfiles",
    logoutput => true,
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
