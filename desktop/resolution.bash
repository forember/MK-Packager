#!/bin/bash
output='VGA-1'
oldres="$(xrandr | sed -nE \
    '/\s[0-9]+x[0-9]+\+0\+0\s/{s/.*\s([0-9]+x[0-9]+)\+0\+0\s.*/\1/;p}')"
printf 'Current resolution is (%s)\n' "$oldres"
allres="$(xrandr | egrep '^\s*[0-9]+x[0-9]+\s' \
    | awk '{ print $1 }' | sort -nr | paste -sd '|')"
newres="$(zenity --forms --title 'Resolution' \
    --text 'Select a display resolution' \
    --add-combo 'Resolution: ' --combo-values "$allres" \
    | sed 's/\s//g')"
[ "$newres" ] || exit
printf 'Changing mode of (%s) to (%s)\n' "$output" "$newres"
xrandr --output "$output" --mode "$newres"
if ! zenity --question --title 'Resolution' --width 200 --timeout 30 \
    --text 'Is this resolution okay?\nIt will revert in 30 seconds.' \
    --ok-label 'Keep' --cancel-label 'Revert' --default-cancel
then
    printf 'Reverting to (%s)\n' "$oldres"
    xrandr --output "$output" --mode "$oldres"
fi
