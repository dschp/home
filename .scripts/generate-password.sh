#!/bin/sh
for i in `seq 1 10`
do
	tr -dc 'A-Za-z0-9@_!#%.,;+-' </dev/urandom | head -c 30; echo
done
