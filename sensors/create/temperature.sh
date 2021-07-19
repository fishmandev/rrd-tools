#!/bin/bash
#

rrdtool create temperatures_tmp.rrd \
--step 60 \
DS:temp:GAUGE:120:0:50 \
RRA:MAX:0.5:1:10080 \
RRA:MAX:0.5:5:8640 \
RRA:MAX:0.5:15:8640 \
RRA:MAX:0.5:30:8640 \
RRA:MAX:0.5:60:8640