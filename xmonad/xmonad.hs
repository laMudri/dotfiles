{-# LANGUAGE QuasiQuotes #-}

module Main where
import XMonad
import XMonad.Actions.CycleRecentWS (cycleRecentWS)
--import XMonad.Actions.Volume
import Graphics.X11.ExtraTypes.XF86
  (xF86XK_AudioLowerVolume, xF86XK_AudioRaiseVolume, xF86XK_AudioMute)
import XMonad.Config.Xfce (xfceConfig)
--import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Hooks.FadeInactive (fadeInactiveLogHook)
import XMonad.Hooks.ManageDocks (manageDocks, avoidStruts)
import XMonad.Hooks.ManageHelpers (isFullscreen, doFullFloat)
import XMonad.Hooks.UrgencyHook (focusUrgent)
import XMonad.Layout.Fullscreen
  (fullscreenFull, fullscreenManageHook, fullscreenEventHook)
import XMonad.Layout.NoBorders (noBorders, smartBorders)
--import XMonad.Layout.PerWorkspace
import XMonad.Layout.Spacing (smartSpacing)
import XMonad.Layout.WorkspaceDir (workspaceDir, changeDir)
import XMonad.Prompt (XPConfig, autoComplete, def, font)
import XMonad.Prompt.AppendFile (appendFilePrompt)
import XMonad.Prompt.Man (manPrompt)
--import XMonad.Prompt.RunOrRaise
import XMonad.Prompt.Shell (shellPrompt)
import XMonad.Prompt.Window (windowPromptBring, windowPromptGoto)
import XMonad.Prompt.XMonad (xmonadPrompt)
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
import Data.Ratio

import Keyboards
import Solarized

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.

myTerminal :: String
myTerminal = "urxvtc"

-- Width of the window border in pixels.

myBorderWidth :: Dimension
myBorderWidth = 1

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt"). You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.

myModMask :: KeyMask
myModMask = mod4Mask

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.

-- A tagging example:
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]

myWorkspaces :: [WorkspaceId]
myWorkspaces = ["1","2","3","4","5","6","7","8","9","0"]

-- Border colors for unfocused and focused windows, respectively.
myNormalBorderColor, myFocusedBorderColor :: String
myNormalBorderColor = solarizedBase01
myFocusedBorderColor = solarizedRed

changeVolume :: String -> X ()
changeVolume s =
  spawn $ "amixer set Master " ++ s
  --spawn [r|
  --  if [[ `pacmd list-sink-inputs | ack RUNNING | wc -l` != 1 ]]; then
  --      mplayer /usr/share/sounds/gnome/default/alerts/drip.ogg
  --  fi
  --  |]

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.

myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
  -- launch a terminal
  [ ((modm,               xK_Return), spawn $ XMonad.terminal conf)
  -- close focused window
  , ((modm .|. shiftMask, xK_k     ), kill)
   -- Rotate through the available layout algorithms
  , ((modm,               xK_space ), sendMessage NextLayout)
  --  Reset the layouts on the current workspace to default
  , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
  -- Resize viewed windows to the correct size
  , ((modm,               xK_k     ), refresh)
  -- Move focus to the next window
  , ((modm,               xK_e     ), windows W.focusDown)
  -- Move focus to the previous window
  , ((modm,               xK_n     ), windows W.focusUp  )
  -- Move focus to the master window
  , ((modm,               xK_m     ), windows W.focusMaster  )
  -- Swap the focused window and the master window
  , ((modm .|. shiftMask, xK_m     ), windows W.swapMaster)
  -- Swap the focused window with the next window
  , ((modm .|. shiftMask, xK_e     ), windows W.swapDown  )
  -- Swap the focused window with the previous window
  , ((modm .|. shiftMask, xK_n     ), windows W.swapUp    )
  -- Shrink the master area
  , ((modm .|. shiftMask, xK_z     ), sendMessage Shrink)
  -- Expand the master area
  , ((modm,               xK_z     ), sendMessage Expand)
  -- Push window back into tiling
  , ((modm,               xK_period), withFocused $ windows . W.sink)
  -- Increment the number of windows in the master area
  , ((modm              , xK_a     ), sendMessage (IncMasterN 1))
  -- Deincrement the number of windows in the master area
  , ((modm .|. shiftMask, xK_a     ), sendMessage (IncMasterN (-1)))

  -- Quit xmonad
  , ((modm .|. shiftMask, xK_q     ), io exitSuccess)
  -- Restart xmonad
  , ((modm              , xK_q     ), restart "xmonad" True)
  -- Cycle through recent workspaces
  , ((modm, xK_Tab), cycleRecentWS [xK_Super_L] xK_Tab xK_grave)

  -- Go to the window that sent a message
  , ((modm, xK_i), focusUrgent)

  -- Volume keys
  , ((0, xF86XK_AudioLowerVolume), changeVolume "1-" >> showVolume)
  , ((0, xF86XK_AudioRaiseVolume), changeVolume "1+" >> showVolume)
  , ((0, xF86XK_AudioMute), changeVolume "toggle" >> showVolume)

  -- Screenshot
  , ((0, xK_Print), spawn "scrot -e 'mv $f ~/screenshots/'")
  , ((controlMask, xK_Print), spawn "scrot -s -e 'mv $f ~/screenshots/'")
  , ((mod4Mask, xK_Print), spawn "scrot -u -e 'mv $f ~/screenshots/'")

  -- Switch XKB layout
  , ((modm, xK_equal), cycleKLayouts)

  -- Prompts
  , ((modm, xK_o), appendFilePrompt xPConfig "/home/james/notes.txt")
  , ((modm, xK_d), changeDir xPConfig)
  , ((modm, xK_F1), manPrompt xPConfig)
  , ((modm, xK_l), shellPrompt xPConfig)
  , ((modm .|. shiftMask, xK_l), spawn "yeganesh -x")
  , ((modm, xK_y), windowPromptBring xPConfig
     { autoComplete = Just 500000 })  -- Don't send keys to new window
  , ((modm .|. shiftMask, xK_y), windowPromptGoto xPConfig
     { autoComplete = Just 500000 })
  , ((modm, xK_c), xmonadPrompt xPConfig)

  -- Screenshots
  --, ((modm, xK_r),
  --   captureWorkspacesWhen defaultPredicate defaultHook horizontally)

  , ((modm, xK_u), namedScratchpadAction scratchpads "terminal")
  , ((modm, xK_v), namedScratchpadAction scratchpads "volume")
  ]
  ++

  -- mod-[1..9], Switch to workspace N
  -- mod-shift-[1..9], Move client to workspace N
  bindNumbers ([xK_1 .. xK_9] ++ [xK_0])
  ++
  bindNumbers [xK_exclam, xK_at, xK_numbersign, xK_dollar, xK_percent,
               xK_asciicircum, xK_ampersand, xK_asterisk, xK_less, xK_greater]
  ++

  -- mod-{w,f,p}, Switch to physical/Xinerama screens 1, 2, or 3
  -- mod-shift-{w,f,p}, Move client to screen 1, 2, or 3
  [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
  | (key, sc) <- zip [xK_w, xK_f, xK_p] [0..]
  , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

  where
    bindNumbers :: [KeySym] -> [((KeyMask, KeySym), X ())]
    bindNumbers keys =
      [((m .|. modm, k), windows $ f i)
      | (i, k) <- zip (XMonad.workspaces conf) keys
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

    xPConfig :: XPConfig
    xPConfig = def { font = "xft:Source Code Pro" }
    showVolume :: X ()
    --showVolume = spawn "notify-send Volume \"$(amixer get Master)\""
    showVolume = return ()


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events

myMouseBindings :: XConfig Layout -> M.Map (KeyMask, Button) (Window -> X())
myMouseBindings (XConfig {XMonad.modMask = modMask}) = M.fromList
  -- mod-button1, Set the window to floating mode and move by dragging
  [ ((modMask, button1), \w -> focus w >> mouseMoveWindow w)
  -- mod-button2, Raise the window to the top of the stack
  , ((modMask, button2), \w -> focus w >> windows W.swapMaster)
  -- mod-button3, Set the window to floating mode and resize by dragging
  , ((modMask, button3), \w -> focus w >> mouseResizeWindow w)
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

myLayoutHook =
  smartSpacing 1 . avoidStruts . workspaceDir "/home/james" . fullscreenFull .
    smartBorders $
      (tiled ||| Mirror tiled ||| fullscreen)
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled = Tall nmaster delta ratio
    -- The default number of windows in the master pane
    nmaster = 1
    -- Default proportion of screen occupied by master pane
    ratio = 1/2
    -- Percent of screen to increment by when resizing panes
    delta = 1/30
    -- Get rid of the unnecessary borders
    fullscreen = noBorders (fullscreenFull Full)

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
  , className =? "Firefox"        --> doShift "1"
  , className =? "Thunderbird"    --> doShift "2"
  --, className =? "Hexchat"        --> doShift "3"
  --, className =? "Pidgin"         --> doShift "3"
  , appName   =? "SRCF"           --> doShift "3"
  , appName   =? "WeeChat"        --> doShift "4"
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

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'DynamicLog' extension for examples.

myLogHook :: X ()
myLogHook = fadeInactiveLogHook (3 / 4)

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q. Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.

myStartupHook :: X ()
myStartupHook = do
  return ()
  --spawn "~/.xmonad/init2"
  --mapM_ spawnOnce
  --  [ "firefox"
  --  , "dunst"
  --  , "urxvtd"
  --  , "taffybar"
  --  , "thunderbird"
  --  , "urxvt -name WeeChat -e weechat"
  --  , "urxvt -name SRCF -e autossh -M7777 jdw74@shell.srcf.net -t 'tmux attach'"
  --  --, "keepassx"
  --  , "volumeicon"
  --  ]

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

main :: IO ()
main = do
  --initCapturing
  xmonad . ewmh . pagerHints $ defaults

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs

-- No need to modify this.

defaults = xfceConfig
  -- simple stuff
  { terminal = myTerminal
  , focusFollowsMouse = myFocusFollowsMouse
  , borderWidth = myBorderWidth
  , modMask = myModMask
  , workspaces = myWorkspaces
  , normalBorderColor = myNormalBorderColor
  , focusedBorderColor = myFocusedBorderColor

  -- key bindings
  , keys = myKeys
  , mouseBindings = myMouseBindings
  , clickJustFocuses = False

  -- hooks, layouts
  , layoutHook = myLayoutHook
  , handleEventHook = fullscreenEventHook
  , manageHook = myManageHook
  , startupHook = myStartupHook
  , logHook = myLogHook
  }
