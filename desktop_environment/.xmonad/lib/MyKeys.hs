module MyKeys (myKeys) where

import XMonad
import XMonad.Actions.SpawnOn
import XMonad.Layout.Maximize
import XMonad.Util.CustomKeys

import Data.String.Utils

netvibesGlobal = "http://www.netvibes.com/privatepage/1"
netvibesPots = "http://www.netvibes.com/privatepage/2"
netvibesOmega = "http://www.netvibes.com/privatepage/4"
googleTranslate = "http://translate.google.com/"

orgLinks = join " " [netvibesGlobal, netvibesPots, netvibesOmega, googleTranslate]

myKeys modm = [
   ((modm, xK_m), withFocused (sendMessage . maximizeRestore)),

   ((0, xK_F4), spawn "chromium-browser"),
   ((0, xK_F6), spawn ("chromium-browser --new-window " ++ orgLinks) ),
   ((0, xK_F5), spawn  "conkeror"),
   ((0, xK_F12), spawn "emacs")
  ]
