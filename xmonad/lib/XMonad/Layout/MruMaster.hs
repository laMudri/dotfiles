{-# LANGUAGE PatternGuards, FlexibleInstances, MultiParamTypeClasses #-}

module XMonad.Layout.MruMaster (autoShiftMaster, MruMaster) where
  
import XMonad
import XMonad.StackSet

import XMonad.Layout.LayoutModifier
import XMonad.Util.Timer

type ASMState = Maybe (Int, TimerId)
data MruMaster a = ASM ASMState deriving (Show, Read)

instance LayoutModifier MruMaster a where
  redoLayout (ASM state) _ (Just (Stack f ls rs)) wrs | length ls > 0 = do
    timerId <- startTimer 1
    return (wrs, update timerId state)
    where
      update :: TimerId -> ASMState -> Maybe (MruMaster a)
      update timerId (Just (pos, ti)) | pos == length ls = Nothing
      update timerId _ = Just (ASM (Just (length ls, timerId)))
  redoLayout _ _ _ wrs = return (wrs, Just (ASM Nothing))

  handleMess (ASM (Just (pos, ti))) m | Just e <- fromMessage m =
    handleTimer ti e $ do
      mNewStack <- gets (stack . workspace . current . windowset)
      doStuff mNewStack
    where
      doStuff :: Maybe (Stack Window) -> X (Maybe (MruMaster a))
      doStuff (Just (Stack f ls rs)) | pos == length ls =
        windows shiftMaster *> return (Just (ASM Nothing))
      doStuff _ = return (Just (ASM Nothing))
  handleMess _ _ | otherwise = return Nothing

autoShiftMaster :: l a -> ModifiedLayout MruMaster l a
autoShiftMaster = ModifiedLayout (ASM Nothing)
