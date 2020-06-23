#!/bin/bash
cd ~/mythtv
/usr/bin/buildbot-worker stop
cat /etc/os-release > info/host
exec /usr/bin/buildbot-worker start

