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

   -- f4 is for gnome-do
   ((0, xK_F6), spawn "notify-send \"$(date +'%T (%D %A)')\""),

   -- Other keys
   ((modm, xK_b), spawn "chromium-browser"),
   ((modm, xK_B), spawn "chromium-browser --incognito"),
   ((modm, xK_a), spawn "conkeror"),
   ((modm, xK_c), spawn "gnome-calculator"),
   ((modm, xK_e), spawn "emacs"),
   ((modm, xK_f), spawn "thunar"),
   ((modm, xK_i), spawn "gksudo synaptic"),
   ((modm, xK_m), spawn "thunderbird"),
   ((modm, xK_n), spawn "kill `pgrep pidgin` & kill `pgrep skype`"),
   ((modm, xK_p), spawn "gnome-system-monitor"),
   ((modm, xK_s), spawn "gnome-screenshot -i"),
   ((modm, xK_t), spawn "urxvt"),
   ((modm, xK_v), spawn "vlc"),
   ((modm, xK_w), spawn "firefox"),

   ((modm .|. controlMask, xK_o), spawn ("chromium-browser --new-window " ++ orgLinks) ),
   ((modm .|. controlMask, xK_e), spawn ("chromium-browser --new-window " ++ entertaimentLinks) )
  ]
