class people::welldan97::packages {
  package { [
    'cabal-install',
    'cairo',
    'catimg',
    'ccat',
    'coreutils',
    'dark-mode',
    'direnv',
    'editorconfig',
    'fasd',
    'ffmpeg',
    'hardlink-osx',
    'heroku-toolbelt',
    'httpie',
    'httrack',
    'imagemagick',
    'jq',
    'moreutils',
    'peco',
    'pixman',
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
    'anki',
    'amethyst',
    'android-file-transfer',
    'anybar',
    'betterzipql',
    'clipmenu',
    'disk-inventory-x',
    'dockertoolbox',
    'emacs',
    'flash',
    'flux',
    'github-desktop',
    'google-chrome',
    'google-drive',
    'iterm2',
    'inkscape',
    'karabiner',
    'lastpass',
    'launchcontrol',
    'mactex',
    'numi',
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
    'torbrowser',
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

  npm_module { 'brunch':
    module       => 'brunch',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'coffee-script':
    module       => 'coffee-script',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'coffeelint':
    module       => 'coffeelint',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'ember-cli':
    module       => 'ember-cli',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'hexo-cli':
    module       => 'hexo-cli',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'js2coffee':
    module       => 'js2coffee',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'grunt-cli':
    module       => 'grunt-cli',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'gulp':
    module       => 'gulp',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'harp':
    module          => 'harp',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'http-console':
    module          => 'http-console',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'js-beautify':
    module          => 'js-beautify',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'mocha':
    module       => 'mocha',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'node-inspector':
    module       => 'node-inspector',
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

  npm_module { 'osx-app-spaces-manager':
    module       => 'osx-app-spaces-manager',
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

  npm_module { 'psi':
    module       => 'psi',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'strongloop':
    module       => 'strongloop',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'wallpaper-cli':
    module       => 'wallpaper-cli',
    node_version => $people::welldan97::config::node_version
  }

  npm_module { 'yo':
    module       => 'yo',
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
