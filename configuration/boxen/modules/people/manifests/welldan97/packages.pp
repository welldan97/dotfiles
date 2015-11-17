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
    'osxfuse',
    'pandoc',
    'rescuetime',
    'skype',
    'steam',
    'sqlitebrowser',
    'transmission',
    'vagrant',
    'vox'
  ]:
    provider => 'brewcask'
  }

  include people::welldan97::full_contact
}
