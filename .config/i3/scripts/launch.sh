#!/usr/bin/env sh
export DESKTOP_SESSION=gnome

# Terminate already running instances
killall -q $1

# Wait until the processes have been shut down
while pgrep -x $1 >/dev/null; do sleep 1; done

# Launch
${@}
