#!/bin/bash
cd ~/mythtv
/usr/bin/buildslave stop
cat /etc/os-release > info/host
exec /usr/bin/buildslave start

