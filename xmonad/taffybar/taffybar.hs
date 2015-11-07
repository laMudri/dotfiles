{-# LANGUAGE OverloadedStrings #-}
import System.Taffybar

import System.Taffybar.Systray
import System.Taffybar.TaffyPager
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

memCallback :: IO [Double]
memCallback = do
  mi <- parseMeminfo
  return [memoryUsedRatio mi]
memCfg :: GraphConfig
memCfg = defaultGraphConfig
           { graphDataColors = [(1, 0, 0, 1)]
           , graphDirection = RIGHT_TO_LEFT
           }

cpuCallback :: IO [Double]
cpuCallback = do
  (userLoad, systemLoad, totalLoad) <- cpuLoad
  return [totalLoad, systemLoad]
cpuCfg :: GraphConfig
cpuCfg = defaultGraphConfig
           { graphDataColors = [(0, 1, 0, 1), (1, 0, 1, 0.5)]
           , graphDirection = RIGHT_TO_LEFT
           }

pagerCfg :: PagerConfig
pagerCfg = defaultPagerConfig

batteryCfg :: BarConfig
batteryCfg = defaultBatteryConfig

clock,pager,mem,cpu,tray,battery,netenp,netwlp,mpris :: IO Widget
clock = textClockNew Nothing "<span fgcolor='orange'>%H:%M</span>" 1
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
         , endWidgets = [clock, battery, netenp, netwlp, mem, cpu, --mpris,
                         tray]
         }
