#!/usr/bin/env bash

layout=$(ibus engine)
echo $layout

if [ "$layout" == "xkb:us::eng" ]; then
	ibus engine xkb:ru::rus
	exit 0
fi

ibus engine xkb:us::eng
exit 0
