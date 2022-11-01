#!/bin/bash
# Toggles eww bar and resizes bspwm padding.

LOCK_FILE="$HOME/.cache/bar.lck"
EWW_BIN="$HOME/installs/eww/target/release/eww"

if [[ ! -f "$LOCK_FILE" ]]; then
    touch "$LOCK_FILE"
    ${EWW_BIN} close bar; sleep 0.4
    bspc config top_padding 0
else
    rm "$LOCK_FILE"
    bspc config top_padding 37

    sleep 0.4; ${EWW_BIN} open bar
fi
