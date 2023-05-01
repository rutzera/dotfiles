#!/bin/bash

function run {
  if ! pgrep "$1" ;
  then
    "$@"&
  fi
}

# sxhkd, bar and compositor
pkill bspc
pkill eww
# kill this to use dunst
pkill xfce4-notifyd

sxhkd &

picom --config "$HOME"/.config/picom/picom.conf &

# TODO: somehow if i copy eww binary to .bin eww wont open in bspwmrc, works from comandline...
# EWW_BIN="$HOME/installs/eww/target/release/eww"
# $EWW_BIN -c "$HOME"/.config/eww --restart daemon
# $EWW_BIN -c "$HOME"/.config/eww open bar
sh "$HOME"/.config/polybar/launch.sh &
#
# killall -q polybar
#
# # Wait until the processes have been shut down
# while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done
#
# desktop=$(echo $DESKTOP_SESSION)
# count=$(xrandr --query | grep " connected" | cut -d" " -f1 | wc -l)
#
#
# case $desktop in
#
#     bspwm|/usr/share/xsessions/bspwm)
#     if type "xrandr" > /dev/null; then
#       for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#         MONITOR=$m polybar --reload mainbar-bspwm -c ~/.config/polybar/conf.ini &
#       done
#     else
#     polybar --reload mainbar-bspwm -c ~/.config/polybar/conf.ini &
#     fi
#     ;;
#
# esac

# TODO: include this in dual_monitor_setup_script or put dualmonior thing into bspwm
# TODO: automate Monitor generation: if 2 plugged in then ....
INTERNAL_MONITOR="eDP1"
EXTERNAL_MONITOR="DP1-3"
xrandr --output eDP1 --mode 2048x1152 --rotate normal
bspc monitor "$EXTERNAL_MONITOR" -d 1 2 3 4 5
bspc monitor "$INTERNAL_MONITOR" -d 6 7 8 9 10


#starting utility applications at boot time
pulseaudio --start &
run variety &
run synology-drive &
# run onedrive_tray &
killall "caffeine-indicator" &
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


notify-send 'bspwm' 'reloaded config'
