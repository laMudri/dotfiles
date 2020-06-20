module XMonad.Actions.FocusAndShiftMaster where
  import XMonad
  import XMonad.StackSet

  import Control.Concurrent
  import Control.Monad

  focusDownAndShiftMaster :: X ()
  focusDownAndShiftMaster = do
    windows focusDown
    mCurrentStack <- gets (stack . workspace . current . windowset)
    case mCurrentStack of
      Nothing -> return ()
      Just (Stack f ls rs) -> do
        io $ threadDelay 1000
        mNewStack <- gets (stack . workspace . current . windowset)
        case mNewStack of
          Nothing -> return ()
          Just (Stack f' ls' rs') ->
            when (length ls == length ls') (windows shiftMaster)
