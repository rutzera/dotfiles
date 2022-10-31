#!/bin/bash

function run {
  if ! pgrep "$1" ;
  then
    "$@"&
  fi
}

# bar and compositor
sh "$HOME"/.config/polybar/launch.sh &


# eww daemon &
# eww -c ~/.config/bspwm/eww close bar
# run eww -c ~/.config/bspwm/eww open bar

# ewwcfg = $HOME/.config/bspwm/eww
# EWW = "which eww"

# launch_eww() {
# 	# ${EWW} --config "$ewwcfg" open eww
#   eww -c ~/.config/bspwm/eww open eww
# }
# # pkill eww
# launch_eww

# $EWW --config "$HOME"/.config/bspwm/eww close bar
# eww --config "$HOME"/.config/bspwm/eww open bar

picom --config "$HOME"/.config/picom/picom.conf &

# TODO: include this in dual_monitor_setup_script or put dualmonior thing into bspwm
xrandr --output eDP1 --mode 2048x1152 &

#starting utility applications at boot time
run variety &
run synology-drive &
killall "caffeine-indicator"
run caffeine-indicator &
run nm-applet &
run xfce4-power-manager &
numlockx on &
blueberry-tray &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &

# laptop trackpad settings
libinput-gestures-setup start &
# cursor fix
xsetroot -cursor_name left_ptr
