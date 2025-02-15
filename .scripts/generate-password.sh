#!/bin/sh
for i in $(seq 1 6)
do
	tr -dc 'A-Za-z0-9@_!#%.,;+-' </dev/urandom | head -c 50; echo
done
