#!/usr/bin/env sh

exec $@ &

kill $(cat /tmp/polybar-launcher.pid)
