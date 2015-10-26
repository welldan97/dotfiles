class people::welldan97::fixes {
  # Fixes

  # Fix homebrew
  file { '/usr/local':
    owner => $boxen_user,
    recurse => true,
    before => Class['homebrew']
  }

  # Fix .gitignore owner propblem
  file { "${people::welldan97::config::home}/.gitconfig":
    owner => $boxen_user
  }

  # Fix default boxen gitignore file

  # HACK
  # due: https://github.com/boxen/puppet-git/issues/7
  Git::Config::Global <| title == "core.excludesfile" |> {
    value => "~/gitignore"
  }
}
