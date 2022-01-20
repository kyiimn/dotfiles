#!/usr/bin/env bash

# Terminate already running bar instances
killall -9 polybar
echo "---" | tee -a /tmp/polybar-left1.log /tmp/polybar-left2.log
echo "---" | tee -a /tmp/polybar-right1.log /tmp/polybar-right2.log
polybar left -c ~/.config/polybar/config -r >>/tmp/polybar-left1.log 2>&1 &
polybar right -c ~/.config/polybar/config -r >>/tmp/polybar-right1.log 2>&1 &
