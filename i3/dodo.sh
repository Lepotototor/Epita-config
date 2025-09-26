#!/bin/sh

while true; do
    #aklog
    i3lock -p win -i ~/.config/i3/Wallpapers/poutou.png
    SECONDS=0
    while [ $SECONDS -lt 3000 ];do
        if ! pgrep i3lock; then
            exit
        fi
    done
    #aklog
    killall i3lock
done
