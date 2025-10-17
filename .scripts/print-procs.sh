#!/bin/sh

STATFILE=/tmp/print-ps.txt

ps aux | awk '$3 != 0.0' | column -t -l 11 -R 2,3,4,5,6,9,10 > $STATFILE
head -n1 $STATFILE
sed '1d' $STATFILE | sort -k3,3nr
