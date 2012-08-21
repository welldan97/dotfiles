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

   -- System keys
   ((modm, xK_m), withFocused (sendMessage . maximizeRestore)),

   -- F1..F12 keys

   -- f1 is for gnome-do
   ((0, xK_F2), spawn "notify-send \"$(date +'%T (%D %A)')\""),

   ((0, xK_F4), spawn "chromium-browser"),
   ((0, xK_F5), spawn "conkeror"),
   ((0, xK_F6), spawn "thunderbird"),

   ((0, xK_F7), spawn ("chromium-browser --new-window " ++ orgLinks) ),
   ((0, xK_F8), spawn ("chromium-browser --new-window " ++ entertaimentLinks) ),

   ((0, xK_F10), spawn "emacs"),
   ((0, xK_F11), spawn "urxvt"),

   -- Other keys
   ((modm, xK_c), spawn "gnome-calculator"),
   ((modm, xK_f), spawn "firefox"),
   ((modm, xK_n), spawn "kill `pgrep pidgin` & kill `pgrep skype`"),
   ((modm, xK_p), spawn "gnome-system-monitor"),
   ((modm, xK_s), spawn "gnome-screenshot -i")
  ]
