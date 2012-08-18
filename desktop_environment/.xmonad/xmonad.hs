import XMonad
import XMonad.Hooks.ManageHelpers (composeOne, isFullscreen, isDialog,  doFullFloat, doCenterFloat)
import XMonad.Util.CustomKeys
import XMonad.Util.EZConfig

import qualified XMonad.StackSet as W
import qualified Data.Map        as M



myWorkspaces = ["1","2","3","4","5","6","7","8","9","0"]

modm = mod4Mask

numPadKeys = [ xK_KP_End,  xK_KP_Down,  xK_KP_Page_Down,
               xK_KP_Left, xK_KP_Begin, xK_KP_Right,
               xK_KP_Home, xK_KP_Up,    xK_KP_Page_Up,
               xK_KP_Insert]

mykeys (XConfig {modMask = modm}) = M.fromList $
         [((m .|. modm, k), windows $ f i) 
           | (i, k) <- zip myWorkspaces numPadKeys,
             (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]


myManageHook = composeAll
  [ className =? "Do" --> doIgnore,
    isDialog          --> doCenterFloat,
    isFullscreen      --> doFullFloat
  ]

myStartupHook = spawn "~/.startup-script"

main = xmonad $ defaultConfig
  { modMask           = modm,
    manageHook        = myManageHook,
    startupHook       = myStartupHook,
    focusFollowsMouse = False,
    workspaces        = myWorkspaces,
    keys              = \c -> mykeys c `M.union` keys defaultConfig c
  } 
