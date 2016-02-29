#!/bin/bash
cd ~/mythtv
/usr/bin/buildslave stop
echo FreeBSD `/bin/freebsd-version` > info/host
exec /usr/bin/buildslave start

