#! /bin/bash

# $1 é o usuário
function wait_warsaw() {
    until pgrep -u $1 core
    do
        echo esperando o warsaw para $1
        sleep 1
    done
}

USER=ff$XUID
adduser --uid $XUID --disabled-password --add_extra_groups --gecos $USER $USER
mkdir -p /run/user/$XUID
chown $XUID:$XUID /run/user/$XUID
chmod 700 /run/user/$XUID

/etc/init.d/warsaw start
wait_warsaw root

setpriv --reuid=$XUID /usr/local/bin/warsaw/core
wait_warsaw $USER

setpriv --reuid=$XUID --reset-env env DISPLAY=$DISPLAY firefox -no-remote -private-window seg.bb.com.br
