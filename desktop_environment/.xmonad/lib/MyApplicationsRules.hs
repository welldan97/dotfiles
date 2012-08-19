module MyApplicationsRules where

import XMonad
import XMonad.Actions.SpawnOn
import XMonad.Hooks.ManageHelpers
import XMonad.Util.CustomKeys
import XMonad.Util.EZConfig

myApplicationsRules = [
  className =? "Do" --> doIgnore,
  className =? "Emacs23" --> doShift "1",

  className =? "Conkeror" --> doShift "4",

  className =? "Pidgin" --> doShift "7",
  className =? "Skype" --> doShift "7",

  className =? "Transmission-gtk" --> doShift "9"
  ]
