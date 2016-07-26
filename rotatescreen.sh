#!/bin/bash
# This script rotates the screen and touchscreen input 90 degrees each time it is called, 
# also disables the touchpad, and enables the virtual keyboard accordingly

# by Ruben Barkow: https://gist.github.com/rubo77/daa262e0229f6e398766

#### configuration
# find your Touchscreen and Touchpad device with `xinput`
TouchscreenDevice='Wacom ISDv4 5002 Finger'
TouchpadDevice='SynPS/2 Synaptics TouchPad'
ScreenName='eDP1'

WacomDevice="Wacom ISDv4 5002"
WacomStylus="$WacomDevice Pen stylus"
WacomEraser="$WacomDevice Pen eraser"

if [ "$1" = "--help"  ] || [ "$1" = "-h"  ] ; then
echo 'Usage: rotate-screen.sh [OPTION]'
echo
echo 'This script rotates the screen and touchscreen input 90 degrees each time it is called,' 
echo 'also disables the touchpad, and enables the virtual keyboard accordingly'
echo
echo Usage:
echo ' -h --help display this help'
echo ' -j (just horizontal) rotates the screen and touchscreen input only 180 degrees'
echo ' -n always rotates the screen back to normal'
exit 0
fi

touchpadEnabled=$(xinput --list-props "$TouchpadDevice" | awk '/Device Enabled/{print $NF}')
screenMatrix=$(xinput --list-props "$TouchscreenDevice" | awk '/Coordinate Transformation Matrix/{print $5$6$7$8$9$10$11$12$NF}')

# Matrix for rotation
# ⎡ 1 0 0 ⎤
# ⎜ 0 1 0 ⎥
# ⎣ 0 0 1 ⎦
normal='1 0 0 0 1 0 0 0 1'
normal_float='1.000000,0.000000,0.000000,0.000000,1.000000,0.000000,0.000000,0.000000,1.000000'

#⎡ -1  0 1 ⎤
#⎜  0 -1 1 ⎥
#⎣  0  0 1 ⎦
inverted='-1 0 1 0 -1 1 0 0 1'
inverted_float='-1.000000,0.000000,1.000000,0.000000,-1.000000,1.000000,0.000000,0.000000,1.000000'

# 90° to the left 
# ⎡ 0 -1 1 ⎤
# ⎜ 1  0 0 ⎥
# ⎣ 0  0 1 ⎦
left='0 -1 1 1 0 0 0 0 1'
left_float='0.000000,-1.000000,1.000000,1.000000,0.000000,0.000000,0.000000,0.000000,1.000000'

# 90° to the right
#⎡  0 1 0 ⎤
#⎜ -1 0 1 ⎥
#⎣  0 0 1 ⎦
right='0 1 0 -1 0 1 0 0 1'

if [ "$1" != "-n" ]
then
  echo "Upside down"
  xrandr --output "$ScreenName" --rotate inverted
  xinput set-prop "$TouchscreenDevice" 'Coordinate Transformation Matrix' $inverted
  xinput disable "$TouchpadDevice"
  # Remove hashtag below if you want pop-up the virtual keyboard  
  #onboard &
  wacomrotate="half"
elif [ $screenMatrix == $inverted_float ] && [ "$1" != "-j" ] && [ "$1" != "-n" ]
then
  echo "90° to the left"
  xrandr --output "$ScreenName" --rotate left
  xinput set-prop "$TouchscreenDevice" 'Coordinate Transformation Matrix' $left
  xinput disable "$TouchpadDevice"
  #killall onboard
  wacomrotate="ccw"
elif [ $screenMatrix == $left_float ] && [ "$1" != "-j" ] && [ "$1" != "-n" ]
then
  echo "90° to the right"
  xrandr --output "$ScreenName" --rotate right
  xinput set-prop "$TouchscreenDevice" 'Coordinate Transformation Matrix' $right
  xinput disable "$TouchpadDevice"
  #killall onboard
  wacomrotate="cw"
else
  echo "Back to normal"
  xrandr --output "$ScreenName" --rotate normal
  xinput set-prop "$TouchscreenDevice" 'Coordinate Transformation Matrix' $normal
  xinput enable "$TouchpadDevice"
  #killall onboard
  wacomrotate="none"
fi

xsetwacom --set "$WacomStylus" Rotate "$wacomrotate"
xsetwacom --set "$WacomEraser" Rotate "$wacomrotate"

# for extended displays -> use touchscreen, stylus etc only for the laptop
xinput --map-to-output 14 eDP1
xinput --map-to-output 15 eDP1
xinput --map-to-output 20 eDP1
