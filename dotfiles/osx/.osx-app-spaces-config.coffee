exec = require('child_process').exec
execSync = require('child_process').execSync

config =
  essentialApps: [
    'Finder'
    'iTerm'
    'Calendar'
    'Emacs-x86_64-10_9'
    'Google Chrome'
    'Skype'
    'VOX'
    'sqlitebrowser'
  ]

  ensureKillApps: [
    'FullContact'
  ]

  ensureRunningApps: [
    'Amethyst'
    'Boom 2'
    'Karabiner'
    'iTerm'
  ]

  spaceActions:
    3: ({ force } = {}, done) ->
      openChrome profile: 'dev', done
    4: ({ force } = {}, done) ->
      execSync 'open -n -a Emacs'
      done()
    5: ({ force } = {}, done) ->
      openChrome done
    7: ({ force } = {}, done) ->
      openChrome profile: 'normal', done
    8: ({ force } = {}, done) ->
      openChrome profile: 'work', done
    9: ({ force } = {}, done) ->
      openChrome profile: 'joy'

  spaceKeys: []

URLS = {}

LETTER_MAP = 'gcrhtnmwvz'
LETTER_MAP.split('').forEach (letter) ->
  config.spaceKeys.push [letter, using: ['command down', 'control down']]

openChrome = (passedOptions..., cb) ->
  options = {
    newWindow: true
    profile: 'default'
    urls: []
  }
  options = Object.assign options, passedOptions[0] if passedOptions[0]
  { profile, url } = options

  CHROME_PROFILES =
    default: 'Default'
    dev: 'Profile 5'
    joy: 'Profile 3'
    work: 'Profile 6'
    clean: 'Profile 7'
    normal: 'Profile 8'

  args = "--profile-directory='#{CHROME_PROFILES[profile]}'"
  args += ' --new-window' if options.newWindow
  args += " '" + options.urls.join("' '") + "'"
  console.log args
  exec "open -n -a 'Google Chrome' --args #{args}", cb

module.exports = config
