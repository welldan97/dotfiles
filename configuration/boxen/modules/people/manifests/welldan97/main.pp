class people::welldan97::main {

  # Build dir tree

  # ~/main
  #   - info
  #   - products
  #   - support
  #     - cloud_storage

  file { [
    "${people::welldan97::config::info}",
    "${people::welldan97::config::products}",
    "${people::welldan97::config::support}"
  ]:
    ensure => "directory",
  }

  file { "${people::welldan97::config::support}/cloud_storage":
    ensure => 'link',
    target => "${people::welldan97::config::home}/Google Drive",
    require => [
      File["${people::welldan97::config::support}"],
      Package['google-drive']
    ]
  }

  # Use zsh
  osx_chsh { $boxen_user:
    shell   => '/bin/zsh',
    require  => Package['zsh']
  }


  # Set up node version
  nodejs::version { '4.2.1': }
  nodejs::version { '5.1.0': }

  class { 'nodejs::global':
    version => $people::welldan97::config::node_version
  }

  exec { 'nodenv rehash':
    command => "${boxen::config::home}/nodenv/bin/nodenv rehash",
    require  =>[
      Npm_Module['pomodoremi']
    ]
  }
}
