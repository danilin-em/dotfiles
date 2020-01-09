#!/usr/bin/env bash

layout=$(xkb-switch)

if [ "$layout" == "us" ]; then
	setxkbmap -layout ru,us
	exit 0
fi

setxkbmap -layout us,ru
exit 0
