#!/bin/sh
mihostname=$(cat /proc/sys/kernel/hostname)
if [ "$mihostname" = 'archlaptop' ];
then
    xbacklight -set 2 &
fi
