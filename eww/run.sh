#! /usr/bin/bash

SCREENS=$(xrandr | grep -sw 'connected' | wc -l)

if [ $SCREENS -eq 2 ]
    then
      eww open-many clock network apps dirs
fi





