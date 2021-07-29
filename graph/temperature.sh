#!/bin/bash
#

rrdtool graph /var/www/html/temperature.png \
-w 600 -h 200 -a PNG \
--slope-mode \
--start -1d --end now \
--lower-limit 0 \
--alt-y-grid \
--vertical-label "Temperature (°C)" \
HRULE:27#ff0000 \
DEF:temp=temperatures.rrd:temp:MAX \
GPRINT:temp:LAST:"Current\: %6.2lf C\n" \
GPRINT:temp:MIN:"Min\:     %6.2lf C" \
AREA:temp#54EC48 \
LINE1:temp#000000