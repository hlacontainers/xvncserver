#!/bin/sh

#
# Copyright 2020 Tom van den Berg (TNO, The Netherlands).
# SPDX-License-Identifier: Apache-2.0
#

if [ -z "$XFB_SCREEN" ]; then
	XFB_SCREEN=1024x768x24
fi

# Start the X-Server
Xvfb -listen tcp :0 -screen 0 $XFB_SCREEN >>~/xvfb.log 2>&1 &

# Start the VNC Server with or without password
if [ -z "$PASSWORD" ]; then
	x11vnc -forever -quiet -nopw -display $DISPLAY &
else 
	x11vnc -forever -quiet -passwd $PASSWORD -display $DISPLAY &
fi

# Sleep to allow the VNC Server to start
sleep 1

# xhost can only be performed after x11vnc has started and there is an X session
# Allow anybody to connect to the X-Server
xhost +

# Wait for x11vnc to terminate
wait %1
