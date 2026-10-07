#!/usr/bin/env bash

selection=$(
  wpctl status |
    sed -n '/Sinks:/,/Sources:/p' |
    grep -E '[0-9]+\.' |
    awk '
    {
        for (i=1; i<=NF; i++) {
            if ($i ~ /^[0-9]+\.$/) {
                id=$i
                gsub(/\./, "", id)

                name=""
                for (j=i+1; j<=NF; j++) {
                    if ($j == "[vol:")
                        break

                    name = name $j " "
                }

                printf "%s\t%s\n", id, name
                break
            }
        }
    }' |
    fuzzel -d
)

[ -z "$selection" ] && exit 0

sink_id=$(echo "$selection" | cut -f1)

wpctl set-default "$sink_id"

notify-send "Audio output changed" "$selection"
