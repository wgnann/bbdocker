#! /bin/bash

USER=ff$XUID
HOME=$(getent passwd $USER | cut -d: -f6)
deluser $USER && rm -rf $HOME
adduser --uid $XUID --disabled-password --add_extra_groups --gecos $USER $USER
mkdir -p /run/user/$XUID
chown $XUID:$XUID /run/user/$XUID
chmod 700 /run/user/$XUID

/etc/init.d/warsaw start
setpriv --reuid=$XUID /usr/local/bin/warsaw/core
setpriv --reuid=$XUID --reset-env env DISPLAY=$DISPLAY firefox -no-remote -private-window seg.bb.com.br
