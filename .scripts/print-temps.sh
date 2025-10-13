#!/bin/sh

#sensors $SENSORS_CHIPS | sed -e 's/(.*)//g' -e '/^  *$/d' -e 's/ *$//g' | column -t -L -s ':'

for chip in $SENSORS_CHIPS; do
	echo "[$chip]"
    sensors $chip | sed -e '1d' -e '/Adapter:/d' -e 's/(.*)//g' -e '/^  *$/d' -e 's/ *$//g' -e 's/  */ /g' -e 's/ *$//g' | column -t -R 1,2 -s ':' -o ':' -d -C width=10 -C width=10
	echo
done

