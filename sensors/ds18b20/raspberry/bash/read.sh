#!/bin/bash
#
# Raspberry PI.
# Reads data from DS18B20 sensor 
# via 1-Wire communications bus system.
#

if [ -z "$1" ]; then
    echo "Please, provide sensor ID"
    exit 1;
fi

file="/sys/bus/w1/devices/$1/w1_slave"

if [ ! -f $file ]; then
    echo "The specified sensor was not found"
    exit 1;
fi

echo `cat $file|awk '/t=/{sub(/^.+t=/, "");c=$0/1000;print c}'`