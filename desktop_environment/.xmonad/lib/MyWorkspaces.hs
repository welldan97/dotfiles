module MyWorkspaces where

import XMonad

import XMonad.Layout.Grid
import XMonad.Layout.Maximize
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.ResizableTile
import XMonad.Layout.Tabbed

myWorkspaces = ["1","2","3","4","5","6","7","8","9","0"]

myLayoutHook  =  onWorkspace "1" full $
                 onWorkspace "4" web $
                 onWorkspace "6" web $
                 onWorkspace "7" chat $
                 onWorkspace "8" full $
                 onWorkspace "9" full $
                 standardLayouts 
  where
    standardLayouts = maximize (smartBorders (tiled ||| Mirror tiled ||| Grid ||| simpleTabbed ||| Full)) 
    web = maximize (smartBorders (tiled ||| full))
    chat = maximize (Grid)
    full = noBorders Full

    tiled = ResizableTall 1 (2/100) (1/2) []
