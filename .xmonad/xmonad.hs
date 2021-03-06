import XMonad
import System.Exit
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import XMonad.Hooks.EwmhDesktops
import XMonad.Actions.CycleWS
import Graphics.X11.ExtraTypes.XF86

myManageHook = composeAll
	[ className =? "firefox" --> doShift "2"
	, className =? "st" --> doShift "1"
	, className =? "Emacs" --> doShift "3"
	]
	
main = do
     xmonad $ ewmh def
         { terminal = "st"
         , modMask = mod4Mask
         , borderWidth = 2
         , keys = myKeys
         , startupHook = autostart
	 , manageHook = myManageHook <+> manageHook defaultConfig
         }

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
     [ ((modm .|. shiftMask, xK_Return), spawn "firefox")
     , ((modm .|. shiftMask, xK_s), spawn "pavucontrol")
     , ((modm .|. shiftMask, xK_q), kill)
     , ((modm, xK_j), windows W.focusDown)
     , ((modm, xK_k), windows W.focusUp)
     , ((modm .|. shiftMask, xK_h), windows W.swapMaster)
     , ((modm, xK_Escape), spawn "i3lock -i ~/Pictures/pixabay/binary-1254502_1280.png")
     , ((modm .|. shiftMask, xK_Escape), io (exitWith ExitSuccess))
     , ((modm, xK_space), spawn "rofi -show run")
     , ((modm, xK_w), spawn "rofi -show window")
     , ((modm .|. shiftMask, xK_z), spawn "$HOME/.config/rofi/pdf.sh")
     , ((modm, xK_Tab), nextScreen)
     , ((0, xF86XK_AudioLowerVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%")
     , ((0, xF86XK_AudioRaiseVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%")
     , ((0, xF86XK_AudioMute), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
     ]
     ++
     [((m .|. modm, k), windows $ f i)
     | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
     , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]


autostart = do
	spawn "feh --bg-fill --randomize $HOME/Pictures/**"
	; spawn "picom &"
	; spawn "firefox"
	; spawn "emacs"
	; spawn  "(pgrep tmux && st -e tmux attach) || st -e tmux"

