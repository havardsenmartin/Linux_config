#!/usr/bin/env bash

selection=$(
  hyprctl clients -j | jq -r '
        .[] |
        select(.mapped == true) |
        "\(.class) — \(.title)|\(.workspace.id)|\(.address)"
    ' | cut -d'|' -f1 | fuzzel --dmenu --width 120
)

[ -z "$selection" ] && exit

full=$(
  hyprctl clients -j | jq -r '
        .[] |
        select(.mapped == true) |
        "\(.class) — \(.title)|\(.workspace.id)|\(.address)"
    ' | grep "^$selection|"
)

workspace=$(echo "$full" | cut -d'|' -f2)
address=$(echo "$full" | cut -d'|' -f3)

hyprctl dispatch workspace "$workspace"
hyprctl dispatch focuswindow "address:$address"
