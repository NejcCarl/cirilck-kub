#!/bin/bash
# Autostart workspaces script
# Launch apps and move to workspaces using wmctrl
# Workspace numbering: 0 = first workspace

# Launch apps
firefox &
brave-browser &
chromium &
google-chrome &
opera &
spotify &
webstorm &
clementine &

# move apps
sleep 5
wmctrl -x -r "brave-browser" -t 0
wmctrl -x -r "spotify" -t 5
wmctrl -x -r "spotify" -b add,fullscreen

sleep 15
wmctrl -x -r "webstorm" -t 10
wmctrl -x -r "chromium" -t 12
wmctrl -x -r "brave-browser" -t 13
wmctrl -x -r "opera" -t 18

sleep 15
wmctrl -x -r "firefox" -t 19

