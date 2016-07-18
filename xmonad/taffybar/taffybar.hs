{-# LANGUAGE OverloadedStrings #-}
import System.Taffybar

import System.Taffybar.Systray
import System.Taffybar.TaffyPager (taffyPagerNew)
import System.Taffybar.Pager
import System.Taffybar.SimpleClock
import System.Taffybar.Battery
import System.Taffybar.NetMonitor
import System.Taffybar.MPRIS

import System.Taffybar.Widgets.PollingBar
import System.Taffybar.Widgets.PollingGraph

import System.Information.Memory
import System.Information.CPU

import Graphics.UI.Gtk.Abstract.Widget (Widget)

import qualified Data.Text as T
import Data.Monoid

base01, base03, red, orange, green, yellow :: (Double, Double, Double)
base01 = (88 / 256, 110 / 256, 117 / 256)
base03 = (0, 43 / 256, 54 / 256)
red = (220 / 256, 50 / 256, 47 / 256)
orange = (203 / 256, 75 / 256, 22 / 256)
green = (133 / 256, 153 / 256, 0)
yellow = (181 / 256, 137 / 256, 0)

addAlpha :: (Double, Double, Double) -> (Double, Double, Double, Double)
addAlpha (r, g, b) = (r, g, b, 1)

myDefaultGraphConfig :: GraphConfig
myDefaultGraphConfig = defaultGraphConfig
  { graphBackgroundColor = (0, 43 / 256, 54 / 256)
  , graphBorderColor = (88 / 256, 110 / 256, 117 / 256)
  , graphDirection = RIGHT_TO_LEFT
  }

memCallback :: IO [Double]
memCallback = do
  mi <- parseMeminfo
  return [memoryUsedRatio mi]
memCfg :: GraphConfig
memCfg = myDefaultGraphConfig
  { graphDataColors = [addAlpha red] }

cpuCallback :: IO [Double]
cpuCallback = do
  (userLoad, systemLoad, totalLoad) <- cpuLoad
  return [totalLoad, systemLoad]
cpuCfg :: GraphConfig
cpuCfg = myDefaultGraphConfig
  { graphDataColors = [ addAlpha green
                      , (147 / 256, 161 / 256, 161 / 256, 1)]
  }

pagerCfg :: PagerConfig
pagerCfg = defaultPagerConfig
  { emptyWorkspace = escape
  , activeWorkspace  = colorize "#b58900" "" . wrap "[" "]" . escape
  , urgentWorkspace  = colorize "#6c71c4" "#d33682" . escape
  }

batteryCfg :: BarConfig
batteryCfg =
  (defaultBarConfig colorFunc)
    { barBorderColor = base01
    , barBackgroundColor = const base03
    }
  where
    colorFunc pct
      | pct < 0.1 = red
      | pct < 0.9 = yellow
      | otherwise = green

clock,pager,mem,cpu,tray,battery,netenp,netwlp,mpris :: IO Widget
clock = textClockNew Nothing "<span fgcolor='#cb4b16'>%H:%M</span>" 1
pager = taffyPagerNew pagerCfg
mem = pollingGraphNew memCfg 1.0 memCallback
cpu = pollingGraphNew cpuCfg 0.5 cpuCallback
tray = systrayNew
battery = batteryBarNew batteryCfg 60.0
netenp = netMonitorNewWith 1.0 "enp4s0" 1 "e: ▼ $inKB$ KB/s ▲ $outKB$ KB/s"
netwlp = netMonitorNewWith 1.0 "wlp2s0" 1 "w: ▼ $inKB$ KB/s ▲ $outKB$ KB/s"
mpris = mprisNew defaultMPRISConfig

main :: IO ()
main = defaultTaffybar defaultTaffybarConfig
         { startWidgets = [pager]
         , endWidgets = [clock, battery, mem, cpu, tray, netenp, netwlp]
         }
