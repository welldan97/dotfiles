class people::welldan97::main {
  # Use zsh
  osx_chsh { $boxen_user:
    shell   => '/bin/zsh',
    require  => Package['zsh']
  }

  nodejs::version { '4.2.1': }
  nodejs::version { '5.1.0': }

  class { 'nodejs::global':
    version => $people::welldan97::config::node_version
  }

  class { 'ruby::global':
    version => $people::welldan97::config::ruby_version
  }

  class {'pow':
    ext_domains => 'xip.io',
  }
}
