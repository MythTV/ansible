#!/bin/bash
cd ~/mythtv
/usr/bin/buildslave stop
/usr/bin/lsb_release -a > info/host
exec /usr/bin/buildslave start

