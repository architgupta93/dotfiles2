#! /bin/bash

displayPort=eDP1
xinput | grep -Po 'Wacom[a-zA-Z0-9\s=]*' | grep -Po '(?<=id\=)[0-9]*' > device-list.txt
xinput | grep -Po 'Touch Digitizer[a-zA-Z0-9\s=]*' | grep -Po '(?<=id\=)[0-9]*' >> device-list.txt
while read i;
	do 
		xinput map-to-output "$i" "$displayPort"
	done < device-list.txt
rm -f device-list.txt
