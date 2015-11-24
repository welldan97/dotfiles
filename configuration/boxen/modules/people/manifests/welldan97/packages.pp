class people::welldan97::packages {
  package { [
    'fasd',
    'direnv',
    'editorconfig',
    'terminal-notifier',
    'tree',
    'youtube-dl',
    'zsh',
    'zsh-completions'
  ]:
  }

  package { [
    'amethyst',
    'android-file-transfer',
    'disk-inventory-x',
    'dockertoolbox',
    'emacs',
    'flash',
    'google-chrome',
    'google-drive',
    'iterm2',
    'karabiner',
    'lastpass',
    'mactex',
    'openemu',
    'osxfuse',
    'pandoc',
    'rescuetime',
    'skype',
    'steam',
    'sqlitebrowser',
    'transmission',
    'vagrant',
    'vox',
    'wkhtmltopdf'
  ]:
    provider => 'brewcask'
  }

  include people::welldan97::full_contact

  npm_module { 'npm':
    module       => 'npm',
    version      => '~> 3.4',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'pomodoremi':
    module       => 'pomodoremi',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'gulp':
    module       => 'gulp',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'mocha':
    module       => 'mocha',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'coffee-script':
    module       => 'coffee-script',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'js2coffee':
    module       => 'js2coffee',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'babel-cli':
    module       => 'babel-cli',
    node_version => $people::welldan97::config::node_version
  }
}
