#!/bin/bash
cd ~/mythtv
/usr/bin/buildslave stop
cat /etc/fedora-release > info/host
exec /usr/bin/buildslave start

