class people::welldan97::packages {
  package { [
    'fasd',
    'direnv',
    'editorconfig',
    'tree',
    'zsh',
    'zsh-completions']:
  }

  package { [
    'amethyst',
    'dockertoolbox',
    'emacs',
    'karabiner',
    'iterm2',
    'google-chrome',
    'google-drive',
    'skype',
    'steam',
    'vagrant'
  ]:
    provider => 'brewcask'
  }
}