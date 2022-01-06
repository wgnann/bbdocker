#! /bin/bash

/etc/init.d/warsaw start
setpriv --reuid=ff /usr/local/bin/warsaw/core
setpriv --reuid=ff --reset-env env DISPLAY=$DISPLAY firefox -no-remote -private-window seg.bb.com.br
