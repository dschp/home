#!/bin/sh
x=1
while [ $x -le 10 ]
do
	tr -dc 'A-Za-z0-9@_!#%.,;+-' </dev/urandom | head -c 50; echo
	x=$[$x+1]
done
