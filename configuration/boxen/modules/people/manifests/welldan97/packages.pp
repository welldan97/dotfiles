class people::welldan97::packages {
  # HACK: should be as a dependency
  homebrew::tap { [
    'caskroom/versions',
    'welldan97/updater',
    'welldan97/whereami'
  ]:
  }

  package { [
    'aspell',
    'atool',
    'cabal-install',
    'cairo',
    'catimg',
    'ccat',
    'coreutils',
    'dark-mode',
    'direnv',
    'editorconfig',
    'elinks',
    'exiftool',
    'fasd',
    'ffmpeg',
    'git-lfs',
    'graphviz',
    'hardlink-osx',
    'heroku-toolbelt',
    'highlight',
    'htop',
    'httpie',
    'httrack',
    'imagemagick',
    'jq',
    'libcaca',
    'lynx',
    'mediainfo',
    'moreutils',
    'mutt',
    'peco',
    'pixman',
    'poppler',
    'pwgen',
    'ranger',
    'redis',
    'source-highlight',
    'terminal-notifier',
    'the_silver_searcher',
    'translate-shell',
    'tree',
    'updater',
    'w3m',
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
    'anki',
    'anybar',
    'betterzipql',
    'clipmenu',
    'disk-inventory-x',
    'dockertoolbox',
    'emacs',
    'flash',
    'flux',
    'fullcontact',
    'github-desktop',
    'google-chrome',
    'google-drive',
    'inkscape',
    'iterm2-beta',
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
    'whereami',
    'wkhtmltopdf'
  ]:
    provider => 'brewcask'
  }

  $npm_modules = [
    'babel-cli',
    'bower',
    'brunch',
    'coffee-script',
    'coffeelint',
    'ember-cli',
    'grunt-cli',
    'gulp',
    'harp',
    'hexo-cli',
    'http-console',
    'is-progressive',
    'js-beautify',
    'js2coffee',
    'live-server',
    'mocha',
    'node-inspector',
    'npm',
    'npm-check-updates',
    'npm-registry-client',
    'osx-app-spaces-manager',
    'phantomjs',
    'pomodoremi',
    'psi',
    'strongloop',
    'typescript',
    'urban',
    'wallpaper-cli',
    'yo'
  ]

  $ruby_gems = [
    'awesome_print',
    'bundler',
    'churn',
    'foreman',
    'hirb',
    'metric_fu',
    'pry',
    'pry-remote',
    'rails',
    'rubocop',
    'scss-lint'
  ]


  define npm_modules_install ($npm_module = $title) {
    npm_module { $npm_module:
      module       => $npm_module,
      node_version => $people::welldan97::config::node_version
    }
  }
  npm_modules_install { $npm_modules: }

  # HACK: manual iteration
  define ruby_gems_install ($ruby_gem = $title, $ruby_versions) {
    ruby_gem { "${ruby_gem} for ${$people::welldan97::config::ruby_versions[0]}":
      gem          => $ruby_gem,
      ruby_version => $people::welldan97::config::ruby_versions[0]
    }

    ruby_gem { "${ruby_gem} for ${$people::welldan97::config::ruby_versions[1]}":
      gem          => $ruby_gem,
      ruby_version => $people::welldan97::config::ruby_versions[1]
    }
  }

  ruby_gems_install {
    $ruby_gems:
      ruby_versions => $people::welldan97::config::ruby_versions
  }
}
