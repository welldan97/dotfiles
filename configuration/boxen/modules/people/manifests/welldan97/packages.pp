class people::welldan97::packages {
  package { [
    'fasd',
    'direnv',
    'editorconfig',
    'terminal-notifier',
    'tree',
    'zsh',
    'zsh-completions'
  ]:
  }

  package { [
    'amethyst',
    'disk-inventory-x',
    'dockertoolbox',
    'emacs',
    'karabiner',
    'iterm2',
    'google-chrome',
    'google-drive',
    'skype',
    'steam',
    'sqlitebrowser',
    'vagrant'
  ]:
    provider => 'brewcask'
  }
}
