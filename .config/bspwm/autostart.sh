#!/bin/bash

function run {
  if ! pgrep "$1" ;
  then
    "$@"&
  fi
}

#run sxhkd -c $HOME/.config/sxhkd/sxhkdrc &
#$HOME/.config/polybar/launch.sh &
picom --config "$HOME"/.config/bspwm/picom.conf &
# $HOME/.config/bspwm/bspwm_monitor &

# TODO: include this in dual_monitor_setup_script or put dualmonior thing into bspwm
xrandr --output eDP1 --mode 2048x1152

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

# LAPTOP settings
# laptop trackpad settings
libinput-gestures-setup start &
# handling external desktop
# sleep 0.5s && autorandr --change &
