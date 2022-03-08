sed -i -e '/edit your config file completely like you were told/d' \
       -e '/Please make sure you edit your config file completely/d' eggdrop.conf
echo "utimer 5 die" >> eggdrop.conf
echo "hello"
exec ./eggdrop -t -m eggdrop.conf
cat ~/eggdrop/pid.LamestBot
