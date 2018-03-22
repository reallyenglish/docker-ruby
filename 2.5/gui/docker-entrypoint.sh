#!/bin/bash

export DISPLAY=:99
PIDFILE=/tmp/custom_xvfb_99.pid

/sbin/start-stop-daemon --start --quiet --pidfile $PIDFILE --make-pidfile --background --exec /usr/bin/Xvfb -- :99 -ac -screen 0 1280x1024x16
exec "${@}"
EXITCODE=$?
/sbin/start-stop-daemon --stop --quiet --pidfile $PIDFILE
exit $EXITCODE
