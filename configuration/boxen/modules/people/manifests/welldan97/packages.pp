class people::welldan97::packages {
  package { [
    'direnv',
    'editorconfig',
    'fasd',
    'terminal-notifier',
    'tree',
    'watchman',
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
    'phantomjs',
    'postgres',
    'rescuetime',
    'skype',
    'sqlitebrowser',
    'steam',
    'transmission',
    'vagrant',
    'vlc',
    'vox',
    'vox-preferences-pane',
    'wkhtmltopdf'
  ]:
    provider => 'brewcask'
  }


  include people::welldan97::full_contact


  npm_module { 'babel-cli':
    module       => 'babel-cli',
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

  npm_module { 'pomodoremi':
    module       => 'pomodoremi',
    node_version => $people::welldan97::config::node_version
  }


  ruby_gem { 'bundler':
    gem          => 'bundler',
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
