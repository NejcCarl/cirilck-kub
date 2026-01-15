#!/bin/bash
# Autostart workspaces script
# Launch apps and move to workspaces using wmctrl
# Workspace numbering: 0 = first workspace

# Launch apps
brave-browser &
spotify &
webstorm &


# move apps
sleep 3
wmctrl -x -r "brave-browser" -t 0
wmctrl -x -r "spotify" -t 5

sleep 15
wmctrl -x -r "webstorm" -t 10
