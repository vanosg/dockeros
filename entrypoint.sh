#!/bin/bash
set -e

if [ "$(id -u)" = '0' ]; then
  chown -R user /home/user/eggdrop .
  exec su user "$BASH_SOURCE" "$@"
fi

sed -i -e '/edit your config file completely like you were told/d' \
       -e '/Please make sure you edit your config file completely/d' eggdrop.conf
echo "utimer 5 die" >> eggdrop.conf
echo "hello"
exec ./eggdrop -m eggdrop.conf
cat ~/eggdrop/pid.LamestBot
