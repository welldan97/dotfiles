import XMonad
import XMonad.Hooks.ManageHelpers
import XMonad.Util.CustomKeys
import XMonad.Util.EZConfig

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import MyKeys
import MyApplicationsRules
import MyWorkspaces

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
    layoutHook        = myLayoutHook,
    focusFollowsMouse = False,
    workspaces        = myWorkspaces,
    terminal          = "urxvt",
    keys              = \c -> allMyKeys c `M.union` keys defaultConfig c
  } 
