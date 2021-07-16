#!/bin/bash
#

rrdtool create temperatures.rrd \
--step 60 \
DS:temp:GAUGE:120:0:50 \
RRA:MAX:0.5:1:1440
