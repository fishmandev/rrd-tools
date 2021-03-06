#!/bin/bash
#

rrdtool create humidity.rrd \
--step 60 \
DS:humidity:GAUGE:120:0:100 \
RRA:MAX:0.5:1:10080 \
RRA:MAX:0.5:5:8640 \
RRA:MAX:0.5:15:8640 \
RRA:MAX:0.5:30:8640 \
RRA:MAX:0.5:60:8640 \
RRA:MAX:0.5:120:8640 \
RRA:AVERAGE:0.5:1:10080 \
RRA:AVERAGE:0.5:5:8640 \
RRA:AVERAGE:0.5:15:8640 \
RRA:AVERAGE:0.5:30:8640 \
RRA:AVERAGE:0.5:60:8640 \
RRA:AVERAGE:0.5:120:8640