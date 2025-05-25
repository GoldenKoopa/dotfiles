#!/usr/bin/env bash

case "$(printf "kill\nsuspend\nreboot\nshutdown" | wofi --dmenu -i -L 5)" in
	kill) ps -u $USER -o pid,comm,%cpu,%mem | wofi --dmenu -i -L 11 -p Kill: | awk '{print $1}' | xargs -r kill ;;
	suspend) systemctl suspend -i ;;
	reboot) systemctl reboot -i ;;
	shutdown) shutdown now ;;
	*) exit 1 ;;
esac
