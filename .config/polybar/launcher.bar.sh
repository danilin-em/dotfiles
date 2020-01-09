#!/usr/bin/env sh

kill $(cat /tmp/polybar-launcher.pid) || true

polybar -c ~/.config/polybar/config.launcher.ini launcher -r &
echo $! > /tmp/polybar-launcher.pid
