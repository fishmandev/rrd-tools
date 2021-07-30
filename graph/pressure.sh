#!/bin/bash
#

rrdtool graph /var/www/html/pressure.png \
-w 600 -h 200 -a PNG \
--slope-mode \
--start -1d --end now \
--vertical-label "Pressure, mmHg" \
DEF:pressure=pressure.rrd:pressure:MAX \
GPRINT:pressure:LAST:"Current\: %6.2lf mmHg\n" \
GPRINT:pressure:MIN:"Min\:     %6.2lf mmHg" \
AREA:pressure#54EC48 \
LINE1:pressure#000000