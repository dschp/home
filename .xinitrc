#!/bin/sh

userresources=$HOME/.Xresources
sysresources=/etc/X11/xinit/Xresources

setxkbmap us -option compose:menu

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

[ -x $HOME/.fehbg ] && $HOME/.fehbg

[ -f $HOME/.xinitrc.env ] && source $HOME/.xinitrc.env
[ -x $HOME/.xinitrc.local ] && $HOME/.xinitrc.local

exec ratpoison
