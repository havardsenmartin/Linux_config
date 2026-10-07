#!/usr/bin/env bash

BASE="$HOME/Pictures/Wallpapers"
CONF="$HOME/.config/hypr/hyprpaper.conf"

choice=$(
  find "$BASE" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' |
    sort |
    fuzzel --dmenu --prompt="Wallpaper set"
)

[ -z "$choice" ] && exit 0

sed -i \
  "s|^\([[:space:]]*path[[:space:]]*=[[:space:]]*\).*|\1$BASE/$choice|" \
  "$CONF"

hyprctl dispatch 'hl.dsp.exec_cmd("pkill hyprpaper; hyprpaper")'
