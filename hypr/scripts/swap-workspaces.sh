#!/usr/bin/env bash

TARGET="$1"
CURRENT=$(hyprctl activeworkspace -j | jq '.id')

# Don't swap with same workspace
[ "$CURRENT" = "$TARGET" ] && exit

TMP=999

move_clients() {
  FROM="$1"
  TO="$2"

  hyprctl clients -j | jq -r \
    ".[] | select(.workspace.id == $FROM) | .address" |
    while read -r addr; do
      hyprctl dispatch movetoworkspacesilent "$TO,address:$addr"
    done
}

# current -> temp
move_clients "$CURRENT" "$TMP"

# target -> current
move_clients "$TARGET" "$CURRENT"

# temp -> target
move_clients "$TMP" "$TARGET"

# follow to target workspace
hyprctl dispatch workspace "$TARGET"
