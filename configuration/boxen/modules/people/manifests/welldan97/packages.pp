class people::welldan97::packages {
  package { [
    'fasd',
    'direnv',
    'editorconfig',
    'terminal-notifier',
    'tree',
    'transmission',
    'youtube-dl',
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
    'lastpass',
    'iterm2',
    'google-chrome',
    'google-drive',
    'skype',
    'steam',
    'transmission-remote-gui',
    'sqlitebrowser',
    'vagrant'
  ]:
    provider => 'brewcask'
  }

  include people::welldan97::full_contact
}
