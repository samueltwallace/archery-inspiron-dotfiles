import XMonad
import System.Exit
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import XMonad.Hooks.EwmhDesktops

main = do
     xmonad $ ewmh def
         { terminal = "alacritty"
         , modMask = mod4Mask
         , borderWidth = 2
         , keys = myKeys
         , startupHook = autostart
         }

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
     [ ((modm .|. shiftMask, xK_Return), spawn "firefox")
     , ((modm, xK_Return), spawn "( pgrep tmux && alacritty -e tmux attach) || alacritty -e tmux")
     , ((modm .|. shiftMask, xK_s), spawn "pavucontrol")
     , ((modm .|. shiftMask, xK_q), kill)
     , ((modm, xK_j), windows W.focusDown)
     , ((modm, xK_k), windows W.focusUp)
     , ((modm .|. shiftMask, xK_h), windows W.swapMaster)
     , ((modm, xK_Escape), spawn "i3lock -c 000000")
     , ((modm, xK_asciitilde), io (exitWith ExitSuccess))
     , ((modm, xK_semicolon), spawn "rofi -show run")
     , ((modm, xK_space), spawn "firefox --search \"$(rofi -dmenu)\"")
     , ((modm, xK_w), spawn "rofi -show window")
     , ((modm .|. shiftMask, xK_z), spawn "$HOME/.config/rofi/pdf.sh")
     ]
     ++
     [((m .|. modm, k), windows $ f i)
     | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
     , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]


autostart = do
	spawn "feh --bg-fill --randomize $HOME/Pictures/**"
	; spawn "picom &"
