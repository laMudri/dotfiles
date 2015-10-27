#!/usr/bin/env runhaskell

{-# LANGUAGE OverloadedStrings #-}

import Turtle

import Control.Concurrent
import Control.Monad

shellE :: Text -> IO ExitCode
shellE x = shell x empty
procE :: Text -> [Text] -> IO ExitCode
procE x ps = proc x ps empty

startIfNotRunning :: Text -> IO ()
startIfNotRunning cmd = do
    c <- procE "pgrep" [cmd]
    case c of
        ExitSuccess -> return ()
        ExitFailure 1 -> void $ shellE cmd
        ExitFailure n ->
            err $ "startIfNotRunning: pgrep status " <> (fromString . show) n

startIfNotRunningP :: Text -> [Text] -> IO ()
startIfNotRunningP cmd args = do
    c <- procE "pgrep" [cmd]
    case c of
        ExitSuccess -> return ()
        ExitFailure 1 -> void $ procE cmd args
        ExitFailure n ->
            err $ "startIfNotRunningP: pgrep status " <> (fromString . show) n

main :: IO ()
main = do
    mapM_ (uncurry export)
        [ ("GTK_IM_MODULE", "ibus")
        , ("XMODIFIERS", "@im=ibus")
        , ("QT_IM_MODULE", "ibus")

        , ("_JAVA_AWT_WM_NONREPARENTING", "1")
        ]

    mapM_ shellE
        [ "ibus-daemon -drx"
        , "synpad-load"

        , "feh --bg-scale ~/Pictures/Yojouhan-Shinwa-Taikei-318342.jpg"

        , "xset -dpms"
        , "xset s noblank"
        , "xset s 0"

        , "xsetroot -cursor_name left_ptr"

        , "xkbset -a" -- Disable slow keys & sticky keys
        ]

    mapM_ (forkIO . startIfNotRunning)
        [ "taffybar"
        , "firefox"
        , "thunderbird"
        , "hexchat"
        , "dunst"
        ]
    --void . forkIO $ startIfNotRunningP "dunst" ["-geom", "0x2-18+30"]
