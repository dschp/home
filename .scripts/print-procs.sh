#!/bin/sh

PS_STAT=/tmp/ps-stat.txt

ps aux > $PS_STAT
head -n1 $PS_STAT \
| awk '{printf "%-5s %5s %5s %5s %9s %8s %-6s %-5s %5s %7s\n", $1, $2, $3, $4, $5, $6, $7, $8, $9, $10}'

sed '1d' $PS_STAT | sort -k3,3nr \
| awk '$3 != 0.0 {
s = substr($0,65);
idx = index(s,$11);
if (idx>0) {s = substr(s,idx)}

printf "%-5s %5s %5s %5s %9s %8s %-6s %-5s %5s %7s", $1, $2, $3, $4, $5, $6, $7, $8, $9, $10;
for (i=11; i<=NF; i++) { printf " %s", $i }
print ""
}'
