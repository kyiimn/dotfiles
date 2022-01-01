#!/usr/bin/env bash

# Terminate already running bar instances
killall -9 polybar
echo "---" | tee -a /tmp/polybar-bottom1.log /tmp/polybar-bottom2.log
polybar bottom -c ~/.config/polybar/config -r >>/tmp/polybar-bottom1.log 2>&1 &
