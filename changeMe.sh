#!/bin/bash

# You'll need to set a keybind to run this script
# It will change the keyboard layout and create a file in `/tmp`
# indicating the current layout lang.
# Use the module `path_exists` of i3status to check 
# if the file (named here `currlang_ar`) is created

layout=$(setxkbmap -query | grep layout | cut -d: -f2 | sed -e 's/^[[:space:]]*//')
if [ $layout == 'us' ] ; then
        setxkbmap ir
        notify-send --expire-time=250 "ir"
        touch /tmp/currlang_ar
else
        setxkbmap us
        notify-send --expire-time=250 "us"
        rm -f /tmp/currlang_ar
fi

exit 0
