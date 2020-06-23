#!/bin/bash
cd ~/mythtv
/usr/bin/buildbot-worker stop
/usr/bin/lsb_release -a > info/host
exec /usr/bin/buildbot-worker start

