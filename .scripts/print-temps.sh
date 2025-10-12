#!/bin/sh

sensors $SENSORS_CHIPS | sed -e 's/(.*)//g' -e '/^  *$/d'
