#!/bin/sh

DIR=$HOME/data/screenshots
if [ ! -d "$DIR" ]; then
  echo "$DIR does not exist."
  exit
fi

sleep 1

cd $DIR
scrot
