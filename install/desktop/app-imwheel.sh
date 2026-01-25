#!/bin/bash

# This script installs imwheel for mouse scroll speed control
sudo apt install -y imwheel

# Create imwheel config for 3x scroll speed
mkdir -p ~/.config
cat > ~/.imwheelrc << 'EOF'
".*"
None,      Up,   Button4, 3
None,      Down, Button5, 3
EOF

# Start imwheel (only grab scroll buttons 4 and 5, leave others alone)
imwheel --kill --buttons "4 5"

# Add imwheel to autostart
mkdir -p ~/.config/autostart
cat > ~/.config/autostart/imwheel.desktop << 'EOF'
[Desktop Entry]
Type=Application
Name=IMWheel
Exec=imwheel --buttons "4 5"
Hidden=false
NoDisplay=true
X-GNOME-Autostart-enabled=true
EOF
