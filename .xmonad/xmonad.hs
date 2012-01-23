import XMonad
import XMonad.Hooks.ICCCMFocus
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Layout.Tabbed
import XMonad.Layout.Spacing
import XMonad.Layout.Circle
import XMonad.Hooks.SetWMName

myTerminal      = "/usr/bin/urxvt"
myBorderWidth   = 3
myNormalBorderColor  = "#333333"
myFocusedBorderColor = "#8800dd"
{-myLayout = simpleTabbed ||| Tall ||| Mirror Tall -}
myWorkspaces = ["1:comm","2:dev","3:idea","4:chrome","5:firefox","6","7","8"]
myManageHook = composeAll
    [ className =? "intellij" --> doShift "3:ide"
    , className =? "firefox" --> doShift "5:firefox"
    , className =? "Thunderbird" --> doShift "1:comm"]

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook--manageHook defaultConfig
        , terminal = myTerminal
        , startupHook = setWMName "LG3D"
        , borderWidth        = myBorderWidth
        , normalBorderColor  = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        , logHook = do
                dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
                takeTopFocus
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        , layoutHook = avoidStruts $ layoutHook defaultConfig ||| simpleTabbed ||| Circle
        , workspaces = myWorkspaces
        {-, manageHook = myManageHook-}
        } `additionalKeys`
        [((mod4Mask, xK_x), spawn "slock")
        ,((mod4Mask, xK_n), spawn "touch ~/.pomodoro_session")]
