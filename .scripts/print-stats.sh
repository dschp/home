#!/bin/sh

DF_STAT=/tmp/df-stat.txt

df -h 2>/dev/null | awk '$3 != 0' > $DF_STAT
head -n1 $DF_STAT
sed '1d' $DF_STAT | sort -k6,6
#df -h
echo

free -m
echo

uptime
