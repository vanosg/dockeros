#!/bin/bash
set -e

if [ "$(id -u)" = '0' ]; then
  chown -R user /home/user/eggdrop .
  exec su user "$BASH_SOURCE" "$@"
fi

sed -i -e '/edit your config file completely like you were told/d' \
       -e '/Please make sure you edit your config file completely/d' eggdrop.conf
#echo "listen 0.0.0.0 3333 all" >> eggdrop.conf
echo "set userfile eggdrop.user" >> eggdrop.conf
#echo "set pidfile \"/eggdata/pid.Lamestbot\"" >> eggdrop.conf
echo "utimer 4 die" >> eggdrop.conf
echo "hello"
exec ./eggdrop -mt eggdrop.conf
sleep 1
