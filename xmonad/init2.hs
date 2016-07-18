#!/usr/bin/env runhaskell

{-# LANGUAGE OverloadedStrings #-}

import Control.Concurrent
import Control.Monad
import Filesystem.Path.CurrentOS (encodeString)
import Turtle
import XMonad.Util.SpawnOnce (spawnOnce)

import Desktop (runDesktopFile)

shellE :: MonadIO io => Text -> io ExitCode
shellE x = shell x empty
procE :: MonadIO io => Text -> [Text] -> io ExitCode
procE x ps = proc x ps empty

startIfNotRunning :: MonadIO io => Text -> io ()
startIfNotRunning cmd = do
  c <- procE "pgrep" [cmd]
  case c of
    ExitSuccess -> return ()
    ExitFailure 1 -> void $ shellE cmd
    ExitFailure n ->
      err $ "startIfNotRunning: pgrep status " <> (fromString . show) n

startIfNotRunningP :: MonadIO io => Text -> [Text] -> io ()
startIfNotRunningP cmd args = do
  c <- procE "pgrep" [cmd]
  case c of
    ExitSuccess -> return ()
    ExitFailure 1 -> void $ procE cmd args
    ExitFailure n ->
      err $ "startIfNotRunningP: pgrep status " <> (fromString . show) n

main :: IO ()
main = do
  --mapM_ (uncurry export)
  --    [ ("_JAVA_AWT_WM_NONREPARENTING", "1")
  --    , ("AWT_TOOLKIT", "MToolKit")
  --    ]

  mapM_ shellE
      [ "feh --bg-scale ~/.background"

      , "xset -dpms"
      , "xset s noblank"
      , "xset s 0"

      , "xsetroot -cursor_name left_ptr"
      , "export _JAVA_AWT_WM_NONREPARENTING=1"
      , "export AWT_TOOLKIT=MToolKit"

      , "xrdb ~/.Xresources"

      , "export GTK_IM_MODULE_FILE=$HOME/gtk2-immodules.cache"

      , "export ASPELL_CONF=data-dir\\ $HOME/.nix-profile/lib/aspell/"
      ]

  sh $ do
    file <- find (ends ".desktop") "/run/current-system/sw/etc/xdg/autostart/"
    liftIO $ runDesktopFile (encodeString file) "Desktop Entry"

  return ()
