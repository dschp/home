#!/bin/sh

STATFILE=/tmp/print-stats.txt

df -h 2>/dev/null | awk '$3 != 0' | sed '1s/.*/\U&/' > $STATFILE
head -n1 $STATFILE
sed '1d' $STATFILE | sort -k6,6
echo

free -m | sed -e '1s/^/MEMORY /' -e '1s/.*/\U&/' -e '2s/^Mem:/phys/' -e '3s/^Swap:/swap/' | column -t -R 2,3,4,5,6,7 > $STATFILE
cat $STATFILE
echo

uptime | column -t -o ' '
