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
    'karabiner',
    'lastpass',
    'iterm2',
    'google-chrome',
    'google-drive',
    'rescuetime',
    'skype',
    'steam',
    'sqlitebrowser',
    'vagrant',
    'vox'
  ]:
    provider => 'brewcask'
  }

  include people::welldan97::full_contact
}
