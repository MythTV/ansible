#!/bin/sh
cd ~/mythtv
/usr/local/bin/buildslave stop
echo FreeBSD `/bin/freebsd-version` > info/host
exec /usr/local/bin/buildslave start
