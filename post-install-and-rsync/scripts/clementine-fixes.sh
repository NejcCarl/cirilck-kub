#!/bin/bash
########################################################
# !!!!Make sure Clementine is closed before you run!!!!
########################################################
#  Fix gear icon in dock (missing StartupWMClass)
cp /usr/share/applications/org.clementine_player.Clementine.desktop ~/.local/share/applications/
sed -i '/^Actions=/a StartupWMClass=clementine' ~/.local/share/applications/org.clementine_player.Clementine.desktop
update-desktop-database ~/.local/share/applications/

## Enable tray icon in top bar
## Close Clementine first, then run:
gnome-extensions enable ubuntu-appindicators@ubuntu.com
cat >> ~/.config/Clementine/Clementine.conf << 'EOF'

[Behaviour]
showtrayicon=true
EOF
