#!/bin/bash
#

rrdtool graph /var/www/html/humidity.png \
-w 600 -h 200 -a PNG \
--slope-mode \
--start -1d --end now \
--lower-limit 0 \
--alt-y-grid \
--vertical-label "Humidity, %" \
DEF:humidity=humidity.rrd:humidity:MAX \
GPRINT:humidity:LAST:"Current\: %6.2lf %%\n" \
GPRINT:humidity:MIN:"Min\:     %6.2lf %%" \
AREA:humidity#54EC48 \
LINE1:humidity#000000