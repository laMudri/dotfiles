module Keyboards (cycleKLayouts) where

import Control.Monad
import Control.Monad.IO.Class (MonadIO(..),liftIO)
import Data.List
import XMonad.Util.Run (runProcessWithInput,safeSpawn)

-- Config section:
-- Add `Left "lang"` for the default keyboard of language with code 'lang'
-- Add `Right ("lang","variant")` for an alternative layout
layouts :: [Either String (String,String)]
layouts = [ Right ("james","progwide_dh")
          --, Right ("james","jbwide")
          , Left "us"
          ]
-- Config ends

parseQueryResult :: String -> Maybe (Either String (String,String))
parseQueryResult s = do
  let ss = lines s
  layout <- last . words <$> find (isPrefixOf "layout") ss
  let variant = last . words <$> find (isPrefixOf "variant") ss
  return $ case variant of
    Nothing -> Left layout
    Just variant -> Right (layout, variant)

runQuery :: MonadIO m => m String
runQuery = runProcessWithInput "setxkbmap" ["-query"] ""

setLayout :: MonadIO m => Either String (String,String) -> m ()
setLayout (Left l) = safeSpawn "setxkbmap" [l]
setLayout (Right (l,v)) = safeSpawn "setxkbmap" [l,v]

-- Circular, so firstAfter (last xs) xs = Just (head xs)
firstAfter :: Eq a => a -> [a] -> Maybe a
firstAfter _ [] = Nothing
firstAfter x (y:ys) = firstAfterWith y x (y:ys)
  where
    firstAfterWith :: Eq a => a -> a -> [a] -> Maybe a
    firstAfterWith first x [y] = if x == y then Just first else Nothing
    firstAfterWith first x (y:z:ys) =
      if x == y then Just z else firstAfterWith first x (z:ys)

cycleKLayouts :: MonadIO m => m ()
cycleKLayouts = do
  current <- parseQueryResult <$> runQuery
  case current >>= (`firstAfter` layouts) of
    Just l -> setLayout l
    Nothing -> setLayout (head layouts)
