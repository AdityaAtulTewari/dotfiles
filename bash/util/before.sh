# Track cd so that it will stay the same on next login
if [ -e ~/.last_cd ]
then
    cd "$(cat ~/.last_cd)"
fi
