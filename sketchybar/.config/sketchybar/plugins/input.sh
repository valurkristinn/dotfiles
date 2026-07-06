INP="$( defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep -w 'KeyboardLayout Name' |sed -E 's/^.+ = \"?([^\"]+)\"?;$/\1/' )"

case "$INP" in
    Icelandic)          INP="IS" ;;
    ABC)          INP="A" ;;
esac

sketchybar --set "$NAME" icon="$ICON" label="$INP" \
  icon.drawing=off \
  label.align=center \
  label.width=30\
  label.padding_right=2 \
  label.padding_left=2 \
  label.color="0xffe7e7e7"
