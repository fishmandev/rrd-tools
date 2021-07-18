#!/bin/bash
#

rrdtool create temperatures.rrd \
--step 60 \
DS:temp:GAUGE:120:0:50 \
RRA:MAX:0.5:1:720 \
RRA:MAX:0.5:5:288 \
RRA:MAX:0.5:15:672 \
RRA:MAX:0.5:60:720
