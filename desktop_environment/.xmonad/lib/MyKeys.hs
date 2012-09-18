module MyKeys (myKeys) where

import XMonad
import XMonad.Layout.Maximize
import XMonad.Util.CustomKeys
import Data.String.Utils

netvibesGlobal = "http://www.netvibes.com/privatepage/1"
netvibesPots = "http://www.netvibes.com/privatepage/2"
netvibesOmega = "http://www.netvibes.com/privatepage/4"
googleTranslate = "http://translate.google.com/"

musicYandex = "http://music.yandex.ru/#!/"
netvibesReader = "http://www.netvibes.com/privatepage/3"
vkontakte = "http://vk.com"

orgLinks = join " " [netvibesGlobal, netvibesPots, netvibesOmega, googleTranslate]
entertaimentLinks = join " " [musicYandex, netvibesReader, vkontakte]

myKeys modm = [
   ((modm, xK_Print), spawn "gnome-screenshot -i"),

   -- f4 is for gnome-do
   ((0, xK_F6), spawn "notify-send \"$(date +'%T (%D %A)')\""),
   ((0, xK_F12), withFocused (sendMessage . maximizeRestore)),

   -- Other keys
   ((modm, xK_b), spawn "chromium-browser"),
   ((modm .|. shiftMask, xK_b), spawn "chromium-browser --incognito"),
   ((modm .|. controlMask, xK_b), spawn "conkeror"),
   ((modm .|. mod1Mask, xK_b), spawn "firefox"),

   ((modm, xK_c), spawn "gnome-calculator"),
   ((modm, xK_e), spawn "emacs"),
   ((modm, xK_f), spawn "thunar"),
   ((modm, xK_m), spawn "urxvt"),
   ((modm, xK_n), spawn "kill `pgrep pidgin` & kill `pgrep skype`"),
   ((modm, xK_p), spawn "gksudo synaptic"),
   ((modm, xK_s), spawn "gnome-system-monitor"),
   ((modm, xK_u), spawn "thunderbird"),
   ((modm, xK_v), spawn "vlc"),

   ((modm .|. controlMask, xK_o), spawn ("chromium-browser --new-window " ++ orgLinks) ),
   ((modm .|. controlMask, xK_e), spawn ("chromium-browser --new-window " ++ entertaimentLinks) )
  ]
