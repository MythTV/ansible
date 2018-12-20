#!/bin/sh
cd ~/mythtv
/usr/local/bin/buildbot-worker stop
echo FreeBSD `/bin/freebsd-version` > info/host
exec /usr/local/bin/buildbot-worker start
