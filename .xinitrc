#!/bin/sh

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

export TERM="urxvt"

#Set background image
#feh --randomize --no-fehbg --bg-fill $HOME/Pictures/EarthPorn/* --randomize --no-fehbg --bg-fill $HOME/Pictures/EarthPorn/*
#feh --no-fehbg --bg-fill $HOME/Pictures/arch_linux_bg.jpg

#use Xresources
xrdb  $HOME/.Xresources


# hide mouse cursor whet it isn't used
unclutter -root -visible &

# pulse audio session
start-pulseaudio-x11

# keyboard layout
setxkbmap de #This can also be done using xmodmap for custom keyboard layout

# disks automounting with system tray icon
udiskie -t &

#start i3 with 25MiB of RAM for debug logs
exec i3 --shmlog-size=2621440 -c $HOME/.config/i3/config
