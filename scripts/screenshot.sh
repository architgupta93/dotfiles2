# !/bin/bash
# This script captures a screenshot and uses the python script "imgClip.py" to
# save the screenshot to the clipboard. This can then be pasted into
# xournal/inkscape etc...

# Requried packages
#	pygtk
#	imagemagick
#	python2

mkdir -p $HOME/4_Pictures
mkdir -p $HOME/4_Pictures/1_Screenshots

# Change the variables below to list the directories where you want to save the
# screenshot (temporarily) and the directory where the imgClip.py sile is stored

SCREENSHOT_DIR='/home/ag/4_Pictures/1_Screenshots/'
SCRIPTS_DIR='/home/ag/0_Unison/4_Collections/1_scripts' 
dateNow=`date +%y-%m-%d--%T`
SCREENSHOT=/home/ag/4_Pictures/1_Screenshots/screenshot--"$dateNow".png
import $SCREENSHOT
python2 "$SCRIPTS_DIR"/imgClip.py $SCREENSHOT

# Comment this line if you want to preserve the screenshot
rm $SCREENSHOT
