#!/bin/bash

# Autostart Workspaces Setup Script
# Creates a .desktop file to launch apps on specific workspaces at login

OMAKUB_DIR="$HOME/.local/share/cirilck-kub"
SCRIPT_SRC="$OMAKUB_DIR/startup/autostart-workspaces.sh"
DESKTOP_FILE="$HOME/.config/autostart/autostart-workspaces.desktop"

echo "Setting up autostart workspaces..."

# Create autostart directory if it doesn't exist
mkdir -p "$HOME/.config/autostart"

# Make the script executable
chmod +x "$SCRIPT_SRC"

# Create the .desktop autostart entry
cat > "$DESKTOP_FILE" << EOF
[Desktop Entry]
Type=Application
Name=Workspace Startup
Comment=Launch applications on specific workspaces
Exec=$SCRIPT_SRC
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
X-GNOME-Autostart-Delay=5
EOF

echo "================================"
echo "Autostart workspaces setup completed!"
echo "================================"
echo "Script location: $SCRIPT_SRC"
echo "Desktop file: $DESKTOP_FILE"
echo ""
echo "Edit $SCRIPT_SRC to customize which apps launch on which workspaces."
echo "Note: wmctrl must be installed (sudo apt install wmctrl)"
