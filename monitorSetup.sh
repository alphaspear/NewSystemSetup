#!/bin/sh
sudo usermod iabhilashjoshi -aG i2c
xrandr --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --primary --mode 2560x1440 --pos 1080x0 --rotate normal --output HDMI-A-0 --mode 1920x1080 --pos 0x0 --rotate left
