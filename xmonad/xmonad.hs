{-# LANGUAGE QuasiQuotes #-}

module Main where
import XMonad
import XMonad.Actions.CycleRecentWS (cycleRecentWS)
import XMonad.Actions.GridSelect
import XMonad.Actions.GroupNavigation
--import XMonad.Actions.Volume
import Graphics.X11.ExtraTypes.XF86
  (xF86XK_AudioLowerVolume, xF86XK_AudioRaiseVolume, xF86XK_AudioMute)
import XMonad.Config.Desktop (desktopLayoutModifiers)
import XMonad.Config.Xfce (xfceConfig)
--import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Hooks.FadeInactive (fadeInactiveLogHook)
import XMonad.Hooks.ManageDocks (manageDocks, avoidStruts)
import XMonad.Hooks.ManageHelpers (isFullscreen, doFullFloat)
import XMonad.Hooks.UrgencyHook (focusUrgent)
import XMonad.Layout.GridVariants (Grid(..))
import XMonad.Layout.Fullscreen
  (fullscreenFull, fullscreenManageHook, fullscreenEventHook)
import XMonad.Layout.NoBorders (noBorders, smartBorders)
--import XMonad.Layout.PerWorkspace
import XMonad.Layout.Spacing (smartSpacing)
import XMonad.Layout.Tabbed
import XMonad.Layout.WorkspaceDir (workspaceDir, changeDir)
import XMonad.Prompt
import XMonad.Prompt.AppendFile (appendFilePrompt)
import XMonad.Prompt.Man (manPrompt)
--import XMonad.Prompt.RunOrRaise
import XMonad.Prompt.Shell (shellPrompt)
import XMonad.Prompt.Unicode
import XMonad.Prompt.Window
import XMonad.Prompt.XMonad (xmonadPrompt)
import XMonad.Util.EZConfig (additionalKeys, additionalMouseBindings)
import XMonad.Util.NamedScratchpad
  (NamedScratchpad(..), namedScratchpadAction, namedScratchpadManageHook, customFloating)
--import XMonad.Util.NamedWindows
--import XMonad.Util.Run
--import XMonad.Util.WorkspaceScreenshot
import XMonad.Util.SpawnOnce (spawnOnce)

import System.Exit
import System.Taffybar.Hooks.PagerHints (pagerHints)

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import Control.Monad
import Data.Char (toLower)
import Data.Function
import Data.List (isInfixOf)
import Data.Ratio

import Keyboards
import Solarized

myTerminal :: String
myTerminal = "termite"

myModMask :: KeyMask
myModMask = mod4Mask

myWorkspaces :: [WorkspaceId]
myWorkspaces = ["`", "1","2","3","4","5","6","7","8","9","0","-","="]

--changeVolume :: String -> X ()
--changeVolume s =
--  spawn $ "amixer set Master " ++ s
--  --spawn [r|
--  --  if [[ `pacmd list-sink-inputs | ack RUNNING | wc -l` != 1 ]]; then
--  --      mplayer /usr/share/sounds/gnome/default/alerts/drip.ogg
--  --  fi
--  --  |]

myNavigation :: TwoD a (Maybe a)
myNavigation = makeXEventhandler $ shadowWithKeymap navKeyMap navDefaultHandler
  where navKeyMap = M.fromList
          [ ((0,xK_Escape), cancel)
          , ((0,xK_Return), select)
          , ((0,xK_slash) , substringSearch myNavigation)
          , ((0,xK_Left)  , move (-1, 0) >> myNavigation)
          , ((0,xK_n)     , move (-1, 0) >> myNavigation)
          , ((0,xK_Right) , move ( 1, 0) >> myNavigation)
          , ((0,xK_e)     , move ( 1, 0) >> myNavigation)
          , ((0,xK_Down)  , move ( 0, 1) >> myNavigation)
          , ((0,xK_o)     , move ( 0, 1) >> myNavigation)
          , ((0,xK_Up)    , move ( 0,-1) >> myNavigation)
          , ((0,xK_i)     , move ( 0,-1) >> myNavigation)
          , ((0,xK_l)     , move (-1,-1) >> myNavigation)
          , ((0,xK_u)     , move ( 1,-1) >> myNavigation)
          , ((0,xK_m)     , move (-1, 1) >> myNavigation)
          , ((0,xK_comma) , move ( 1, 1) >> myNavigation)
          , ((0,xK_space) , setPos (0,0) >> myNavigation)
          ]
        -- The navigation handler ignores unknown key symbols
        navDefaultHandler = const myNavigation

myGSConfig :: HasColorizer a => GSConfig a
myGSConfig = def { gs_navigate = myNavigation }

myXPConfig :: XPConfig
myXPConfig = def
  { font = "xft:DejaVu Sans Mono"
  , searchPredicate = isInfixOf `on` map toLower
  }

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.

myKeys :: [((KeyMask, KeySym), (X ()))]
myKeys =
  -- launch a terminal
  [ ((myModMask,               xK_Return), spawn $ myTerminal)
  -- close focused window
  , ((myModMask .|. shiftMask, xK_k     ), kill)
   -- Rotate through the available layout algorithms
  , ((myModMask,               xK_space ), sendMessage NextLayout)
  --  Reset the layouts on the current workspace to default
  --, ((myModMask .|. shiftMask, xK_space ), setLayout $ layoutHook baseConfig)
  -- Resize viewed windows to the correct size
  , ((myModMask,               xK_k     ), refresh)
  -- Move focus to the next window
  , ((myModMask,               xK_e     ), windows W.focusDown)
  -- Move focus to the previous window
  , ((myModMask,               xK_n     ), windows W.focusUp)
  -- Move focus to the master window
  , ((myModMask,               xK_m     ), windows W.focusMaster)
  -- Swap the focused window and the master window
  , ((myModMask .|. shiftMask, xK_m     ), windows W.swapMaster)
  -- Swap the focused window with the next window
  , ((myModMask .|. shiftMask, xK_e     ), windows W.swapDown)
  -- Swap the focused window with the previous window
  , ((myModMask .|. shiftMask, xK_n     ), windows W.swapUp)
  -- Shrink the master area
  , ((myModMask .|. shiftMask, xK_z     ), sendMessage Shrink)
  -- Expand the master area
  , ((myModMask,               xK_z     ), sendMessage Expand)
  -- Push window back into tiling
  , ((myModMask,               xK_period), withFocused $ windows . W.sink)
  -- Increment the number of windows in the master area
  , ((myModMask              , xK_a     ), sendMessage (IncMasterN 1))
  -- Deincrement the number of windows in the master area
  , ((myModMask .|. shiftMask, xK_a     ), sendMessage (IncMasterN (-1)))

  -- Quit xmonad
  , ((myModMask .|. shiftMask, xK_q     ), io exitSuccess)
  -- Restart xmonad
  , ((myModMask              , xK_q     ), restart "xmonad" True)
  -- Cycle through recent workspaces
  , ((myModMask              , xK_Tab   ),
    cycleRecentWS [xK_Super_L] xK_Tab xK_grave)
  -- Go to last focused window
  , ((myModMask              , xK_u     ), nextMatch History (return True))
  -- Start grid select
  , ((myModMask              , xK_h     ), goToSelected myGSConfig)

  -- Go to the window that sent a message
  , ((myModMask              , xK_i     ), focusUrgent)

  -- Volume keys
  --, ((0, xF86XK_AudioLowerVolume), changeVolume "1-" >> showVolume)
  --, ((0, xF86XK_AudioRaiseVolume), changeVolume "1+" >> showVolume)
  --, ((0, xF86XK_AudioMute), changeVolume "toggle" >> showVolume)

  -- Screenshot
  , ((0                      , xK_Print ),
    spawn "scrot -e 'mv $f ~/screenshots/'")
  , ((controlMask            , xK_Print ),
    spawn "scrot -s -e 'mv $f ~/screenshots/'")
  , ((mod4Mask               , xK_Print ),
    spawn "scrot -u -e 'mv $f ~/screenshots/'")

  -- Switch XKB layout
  , ((myModMask              , xK_equal ), cycleKLayouts)

  -- Prompts
  , ((myModMask              , xK_o     ),
    appendFilePrompt myXPConfig "/home/james/notes.txt")
  , ((myModMask              , xK_d     ), changeDir myXPConfig)
  , ((myModMask              , xK_F1    ), manPrompt myXPConfig)
  , ((myModMask              , xK_l     ), shellPrompt myXPConfig)
  , ((myModMask .|. shiftMask, xK_l     ), spawn "yeganesh -x")
  , ((myModMask              , xK_y     ),
    windowPromptBring myXPConfig { autoComplete = Just 500000 })
  , ((myModMask .|. shiftMask, xK_y     ),
    windowPromptGoto myXPConfig { autoComplete = Just 500000 })
  , ((myModMask              , xK_c     ), xmonadPrompt myXPConfig)
  , ((myModMask              , xK_r     ),
    windowPrompt myXPConfig Goto wsWindows)
  -- Need to rework this to not hard-code /usr/share/...
  --, ((myModMask              , xK_u     ), unicodePrompt myXPConfig)

  -- Screenshots
  --, ((myModMask, xK_r),
  --   captureWorkspacesWhen defaultPredicate defaultHook horizontally)

  --, ((myModMask              , xK_u     ),
  --  namedScratchpadAction scratchpads "terminal")
  --, ((myModMask              , xK_v     ),
  --  namedScratchpadAction scratchpads "volume")
  ]
  ++

  --bindNumbers ([xK_grave] ++ [xK_1 .. xK_9] ++ [xK_0, xK_minus, xK_equals])
  -- ++
  bindNumbers [xK_grave, xK_exclam, xK_at, xK_numbersign, xK_dollar, xK_percent,
               xK_asciicircum, xK_ampersand, xK_asterisk, xK_less, xK_greater,
               xK_minus, xK_equal]
  ++

  -- mod-{w,f,p}, Switch to physical/Xinerama screens 1, 2, or 3
  -- mod-shift-{w,f,p}, Move client to screen 1, 2, or 3
  [((m .|. myModMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
  | (key, sc) <- zip [xK_w, xK_f, xK_p] [0..]
  , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

  where
    bindNumbers :: [KeySym] -> [((KeyMask, KeySym), X ())]
    bindNumbers keys =
      [((m .|. myModMask, k), windows $ f i)
      | (i, k) <- zip myWorkspaces keys
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

    showVolume :: X ()
    --showVolume = spawn "notify-send Volume \"$(amixer get Master)\""
    showVolume = return ()


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events

myMouseBindings :: [((KeyMask, Button), (Window -> X()))]
myMouseBindings =
  -- mod-button1, Set the window to floating mode and move by dragging
  [ ((myModMask, button1), \w -> focus w >> mouseMoveWindow w)
  -- mod-button2, Raise the window to the top of the stack
  , ((myModMask, button2), \w -> focus w >> windows W.swapMaster)
  -- mod-button3, Set the window to floating mode and resize by dragging
  , ((myModMask, button3), \w -> focus w >> mouseResizeWindow w)
  -- you may also bind events to the mouse scroll wheel (button4 and button5)
  ]

------------------------------------------------------------------------
-- Layouts:

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.

-- The available layouts. Note that each layout is separated by |||,
-- which denotes layout choice.

myLayoutHook' =
  smartSpacing 1 . avoidStruts . workspaceDir "/home/james" . fullscreenFull .
    smartBorders $
      (grid ||| Mirror tiled ||| myTabbed ||| fullscreen)
  where
    grid = Grid (17/10)
    -- default tiling algorithm partitions the screen into two panes
    tiled = Tall nmaster delta ratio
    -- The default number of windows in the master pane
    nmaster = 1
    -- Default proportion of screen occupied by master pane
    ratio = 1/2
    -- Percent of screen to increment by when resizing panes
    delta = 1/30
    -- Tabbed layout
    myTabbed = tabbedLeft shrinkText (def
     { activeColor = solarizedBase02
     , inactiveColor = solarizedBase03
     , urgentColor = solarizedBase3

     , activeBorderColor = solarizedRed
     , inactiveBorderColor = solarizedBase0
     , urgentBorderColor = solarizedBase00

     , activeTextColor = solarizedRed
     , inactiveTextColor = solarizedBase0
     , urgentTextColor = solarizedBase00

     , fontName =
       "xft:sans-serif:pixelsize=13:antialias=true:hinting=true,\
       \ xft:Source Han Sans JP:pixelsize=13:antialias=true:hinting=true"
     })
    --myTabbed = simpleTabbedLeft
    -- Get rid of the unnecessary borders
    fullscreen = Full --noBorders (fullscreenFull Full)

myLayoutHook = desktopLayoutModifiers myLayoutHook'

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.

-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.

-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.

myManageHook :: ManageHook
myManageHook = composeAll
  [ className =? "MPlayer"        --> doFloat
  , className =? "Gimp"           --> doFloat
  --, className =? "Firefox"        --> doShift "1"
  --, className =? "Thunderbird"    --> doShift "2"
  , appName   =? "SRCF"           --> doShift "3"
  , appName   =? "irc"            --> doShift "3"
  , appName   =? "np-bot"         --> doShift "-"
  , appName   =? "music-player"   --> doShift "="
  --, className =? "Keepassx"       --> doShift "5"
  , className =? "Gnome-panel"    --> doIgnore
  , resource  =? "desktop_window" --> doIgnore
  , resource  =? "kdesktop"       --> doIgnore
  , className =? "Xfce4-panel"    --> doIgnore
  , isFullscreen                  --> doFullFloat
  , manageDocks
  , namedScratchpadManageHook scratchpads
  , fullscreenManageHook
  ]

role :: Query String
role = stringProperty "WM_WINDOW_ROLE"

scratchpads :: [NamedScratchpad]
scratchpads =
  [ NS "terminal" "urxvtc -name terminalSP"
       (appName =? "terminalSP") manageTerminalSP
  , NS "volume" "urxvtc -name volumeSP -e alsamixer"
       (appName =? "volumeSP") manageVolumeSP
  ]

manageTerminalSP :: ManageHook
manageTerminalSP = customFloating (W.RationalRect l t w h)
  where
    h = 1 / 4
    w = 1
    t = 1 - h
    l = 0

manageVolumeSP :: ManageHook
manageVolumeSP = customFloating (W.RationalRect l t w h)
  where
    h = 2 / 3
    w = 1 / 3
    t = (1 - h) / 2
    l = 1 - w

baseConfig = xfceConfig

myConfig = baseConfig
  -- simple stuff
  { terminal = myTerminal
  , focusFollowsMouse = False
  , borderWidth = 1
  , modMask = myModMask
  , workspaces = myWorkspaces
  , normalBorderColor = solarizedBase01
  , focusedBorderColor = solarizedRed

  , clickJustFocuses = False

  -- hooks, layouts
  , layoutHook = myLayoutHook
  , handleEventHook = handleEventHook baseConfig <+> fullscreenEventHook
  , manageHook = manageHook baseConfig <+> myManageHook
  , logHook = logHook baseConfig <+> fadeInactiveLogHook (3 / 4)
  }
  `additionalKeys` myKeys
  `additionalMouseBindings` myMouseBindings

main :: IO ()
main = do
  --initCapturing
  xmonad . ewmh . pagerHints $ myConfig
