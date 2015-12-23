class people::welldan97::packages {
  package { [
    'catimg',
    'ccat',
    'direnv',
    'editorconfig',
    'fasd',
    'jq',
    'httpie',
    'imagemagick',
    'peco',
    'terminal-notifier',
    'tree',
    'watchman',
    'youtube-dl',
    'zsh',
    'zsh-completions',
    'zsh-syntax-highlighting'
  ]:
  }


  package { [
    'amethyst',
    'android-file-transfer',
    'betterzipql',
    'disk-inventory-x',
    'dockertoolbox',
    'emacs',
    'flash',
    'flux',
    'github-desktop',
    'google-chrome',
    'google-drive',
    'iterm2',
    'karabiner',
    'lastpass',
    'mactex',
    'openemu',
    'osxfuse',
    'pandoc',
    'postgres',
    'qlcolorcode',
    'qlimagesize',
    'qlmarkdown',
    'qlprettypatch',
    'qlstephen',
    'quicklook-csv',
    'quicklook-json',
    'rescuetime',
    'skitch',
    'skype',
    'slack',
    'sqlitebrowser',
    'steam',
    'suspicious-package',
    'the-unarchiver',
    'transmission',
    'vagrant',
    'vlc',
    'vox',
    'vox-preferences-pane',
    'webpquicklook',
    'wkhtmltopdf'
  ]:
    provider => 'brewcask'
  }


  include people::welldan97::full_contact


  npm_module { 'babel-cli':
    module       => 'babel-cli',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'bower':
    module       => 'bower',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'coffee-script':
    module       => 'coffee-script',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'ember-cli':
    module       => 'ember-cli',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'js2coffee':
    module       => 'js2coffee',
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

  npm_module { 'npm':
    module       => 'npm',
    version      => '~> 3.5',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'npm-registry-client':
    module       => 'npm-registry-client',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'phantomjs':
    module       => 'phantomjs',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'pomodoremi':
    module       => 'pomodoremi',
    node_version => $people::welldan97::config::node_version
  }

  ruby_gem { 'awesome_print':
    gem          => 'awesome_print',
    ruby_version => $people::welldan97::config::ruby_version
  }

  ruby_gem { 'bundler':
    gem          => 'bundler',
    ruby_version => $people::welldan97::config::ruby_version
  }

  ruby_gem { 'hirb':
    gem          => 'hirb',
    ruby_version => $people::welldan97::config::ruby_version
  }

  ruby_gem { 'pry':
    gem          => 'pry',
    ruby_version => $people::welldan97::config::ruby_version
  }

  ruby_gem { 'rails':
    gem          => 'rails',
    ruby_version => $people::welldan97::config::ruby_version
  }
}
