#!/bin/bash
set -e

if [ "$(id -u)" = '0' ]; then
  chown -R user /home/user/eggdrop .
  exec su user "$BASH_SOURCE" "$@"
fi

sed -i -e '/edit your config file completely like you were told/d' \
       -e '/Please make sure you edit your config file completely/d' eggdrop.conf
echo "listen 127.0.0.1 3333 all" >> eggdrop.conf
echo "set userfile eggdrop.user" >> eggdrop.conf
echo "utimer 10 die" >> eggdrop.conf
echo "hello"
exec ./eggdrop -tm eggdrop.conf
if [ -a /home/user/eggdrop/pid.Lamestbot ]; then
    echo "-=| TEST: PID: $(cat /home/user/eggdrop/pid.Lamestbot)" > /data/pidtest
else
    echo "-=| TEST: PID: Not running!" > /data/pidtest
fi
