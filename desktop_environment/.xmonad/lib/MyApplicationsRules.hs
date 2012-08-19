module MyApplicationsRules where

import XMonad

myApplicationsRules = [
  className =? "Do" --> doIgnore,
  className =? "Emacs23" --> doShift "1",

  className =? "Conkeror" --> doShift "4",

  className =? "Pidgin" --> doShift "7",
  className =? "Skype" --> doShift "7",

  className =? "Thunderbird" --> doShift "8",

  className =? "Transmission-gtk" --> doShift "9"
  ]
