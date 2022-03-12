#!/bin/bash
set -e

if [ "$(id -u)" = '0' ]; then
  chown -R user /home/user/eggdrop .
  exec su user "$BASH_SOURCE" "$@"
fi

sed -i -e '/edit your config file completely like you were told/d' \
       -e '/Please make sure you edit your config file completely/d' eggdrop.conf
echo "listen 0.0.0.0 3333 all" >> eggdrop.conf
echo "set userfile eggdrop.user" >> eggdrop.conf
echo "set pidfile /eggdata/pid.Lamestbot"
#echo "utimer 10 die" >> eggdrop.conf
echo "hello"
exec ./eggdrop -m eggdrop.conf
ls -al /eggdata
if [ -a /home/user/eggdrop/pid.Lamestbot ]; then
    echo "-=| TEST: PID: $(cat /home/user/eggdrop/pid.Lamestbot)" > /eggdata/pidtest
else
    echo "-=| TEST: PID: Not running!" > /eggdata/pidtest
fi
