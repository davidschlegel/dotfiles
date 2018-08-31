#!/bin/sh

xautolock -time 5 -locker "$HOME/Programs/i3-lock-fancy-multimonotor-master/lock" &
xautolock -time 7 -locker "systemctl suspend" &
