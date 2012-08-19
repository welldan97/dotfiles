import XMonad
import XMonad.Actions.SpawnOn
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.PerWorkspace
import XMonad.Util.CustomKeys
import XMonad.Util.EZConfig
-- import XMonad.Layout.IM
import XMonad.Layout.Maximize

import qualified XMonad.StackSet as W
import qualified Data.Map        as M
-- import Data.Ratio ((%))

import MyKeys
import MyApplicationsRules

myWorkspaces = ["1","2","3","4","5","6","7","8","9","0"]

-- myLayoutHook = 

modm = mod4Mask

numPadKeys = [ xK_KP_End,  xK_KP_Down,  xK_KP_Page_Down,
               xK_KP_Left, xK_KP_Begin, xK_KP_Right,
               xK_KP_Home, xK_KP_Up,    xK_KP_Page_Up,
               xK_KP_Insert]

allMyKeys (XConfig {modMask = modm}) = M.fromList $
  myKeys modm
  ++
  [((m .|. modm, k), windows $ f i) 
    | (i, k) <- zip myWorkspaces numPadKeys,
      (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]


myManageHook = composeAll(
    myApplicationsRules
    ++
    [
      isDialog          --> doCenterFloat,
      isFullscreen      --> doFullFloat
    ]
  )


myStartupHook = spawn "~/.startup-script"

main = xmonad $ defaultConfig
  { modMask           = modm,
    manageHook        = myManageHook,
    startupHook       = myStartupHook,
--     layoutHook        = myLayoutHook,
    focusFollowsMouse = False,
    workspaces        = myWorkspaces,
    keys              = \c -> allMyKeys c `M.union` keys defaultConfig c
  } 
