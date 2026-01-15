#!/bin/bash
# Autostart workspaces script
# Launch apps and move to workspaces using wmctrl
# Workspace numbering: 0 = first workspace

# Launch Brave and move to workspace 0
brave-browser &
sleep 2
wmctrl -x -r "brave-browser" -t 0

# Launch spotify and move to workspace 5
spotify &
sleep 3
wmctrl -x -r "spotify" -t 5

# Launch webstorm and move to workspace 10
webstorm &
sleep 15
wmctrl -x -r "webstorm" -t 10
