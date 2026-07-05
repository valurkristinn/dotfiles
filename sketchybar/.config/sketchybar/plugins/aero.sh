#!/bin/sh

FOCUSED="$(aerospace list-workspaces --focused)"
ALL_WS="$(aerospace list-workspaces --all)"
TMPD="$(mktemp -d)"
trap 'rm -rf "$TMPD"' EXIT INT TERM

# Fire all window queries in parallel
for w in $ALL_WS; do
    aerospace list-windows --workspace "$w" > "$TMPD/$w" 2>/dev/null &
done
wait

set --

for w in $ALL_WS; do
    if [ "$w" = "$FOCUSED" ]; then
        FONT=".AppleSystemUIFont:Semibold:14.0"
        COLOR="0xffffffff"
        DRAWING=on
    elif [ -s "$TMPD/$w" ]; then
        FONT=".AppleSystemUIFont:Regular:14.0"
        COLOR="0xffe7e7e7"
        DRAWING=on
    else
        FONT=".AppleSystemUIFont:Regular:14.0"
        COLOR="0xffe7e7e7"
        DRAWING=off
    fi

    set -- "$@" \
        --set "w.$w" \
        label="$w" \
        icon.drawing=off \
        label.width=26 \
        label.align=center \
        label.drawing="$DRAWING" \
        label.font="$FONT" \
        label.color="$COLOR"\
        background.padding_left=0 \
        background.padding_right=0
done

sketchybar "$@"
