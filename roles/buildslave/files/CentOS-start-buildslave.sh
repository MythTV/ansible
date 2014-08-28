#!/bin/bash
cd ~/mythtv
/usr/bin/buildslave stop
cat /etc/redhat-release > info/host
exec /usr/bin/buildslave start

