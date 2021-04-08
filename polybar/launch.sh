#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar-top1.log /tmp/polybar-top2.log
echo "---" | tee -a /tmp/polybar-bottom1.log /tmp/polybar-bottom2.log
#polybar black >>/tmp/polybar1.log 2>&1 & disown
polybar top -c ~/.config/polybar/config -r >>/tmp/polybar-top1.log 2>&1 & 
polybar bottom -c ~/.config/polybar/config -r >>/tmp/polybar-bottom1.log 2>&1 &
echo "Bars launched..."
