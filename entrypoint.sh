sed -i -e '/edit your config file completely like you were told/d' \
       -e '/Please make sure you edit your config file completely/d' eggdrop.conf
echo "utimer 5 die" >> eggdrop.conf
exec ./eggdrop -nt -m eggdrop.conf
cat ~/eggdrop/pid.LamestBot
