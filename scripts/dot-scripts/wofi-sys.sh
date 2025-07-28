#!/usr/bin/env bash

case "$(printf "kill\nsuspend\nreboot\nshutdown\nlock" | wofi --dmenu -i)" in
	kill) ps -u $USER -o pid,comm,%cpu,%mem | wofi --dmenu -i -L 11 -p Kill: | awk '{print $1}' | xargs -r kill ;;
	suspend) systemctl suspend ;;
	reboot) systemctl reboot ;;
	shutdown) shutdown now ;;
    lock) pidof hyprlock || hyprlock ;;
	*) exit 1 ;;
esac
