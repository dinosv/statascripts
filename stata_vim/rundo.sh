#!/bin/bash

# needs xdotool, xte and xsel
# to get them run
# sudo apt-get install wmctrl xautomation xsel
# in debian/ubuntu linux

#copy to clipboard "do filename"
echo 'do ' '"'$1'"' | xsel -b

# get current window id
winedit=`xdotool getwindowfocus`
winstata=`xdotool search "Stata/SE 15.1" | head -1`

# check for stata window, if found activate else execute
# use correct version here
if [ "$(pgrep stata)" ] 
then
   xdotool windowactivate --sync $winstata
else
    /usr/local/stata15/xstata-se &
    sleep 1s 
fi

# delay depends on window manager etc
# .1 ok with xmonad in 10.04
sleep .1 

# switch to command line, ctrl-4 in stata 10, ctrl-1 in 11/12
# and select existing text via ctrl-a
xte 'keydown Control_L' 'key 1' 'key A' 'usleep 100' \
    'key V' 'keyup Control_L' 
sleep 1 
xte 'key Return'
sleep 1

# go back to editor window
#xdotool windowactivate --sync $winedit

