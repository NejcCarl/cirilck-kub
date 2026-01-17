#!/bin/bash

sudo apt install -y gnome-shell-extension-manager gir1.2-gtop-2.0 gir1.2-clutter-1.0
pipx install gnome-extensions-cli --system-site-packages

# Turn off default Ubuntu extensions
gnome-extensions disable tiling-assistant@ubuntu.com
gnome-extensions disable ubuntu-appindicators@ubuntu.com
gnome-extensions disable ubuntu-dock@ubuntu.com
gnome-extensions disable ding@rastersoft.com

# Pause to assure user is ready to accept confirmations
gum confirm "To install Gnome extensions, you need to accept some confirmations. Ready?"

# Install new extensions

# Tactile: Grid-based window tiling with keyboard shortcuts
gext install tactile@lundal.io

# Just Perfection: Tweak GNOME Shell UI elements (animations, panel, dash visibility)
gext install just-perfection-desktop@just-perfection

# Blur My Shell: Add blur effects to overview, dash, and other shell components
gext install blur-my-shell@aunetx

# Undecorate: Remove window decorations (title bars) from maximized windows
gext install undecorate@sun.wxg@gmail.com

# TopHat: System monitor showing CPU, memory, network, and disk usage in the top panel
gext install tophat@fflewddur.github.io

# Alphabetical App Grid: Sort applications in the app grid alphabetically
gext install AlphabeticalAppGrid@stuarthayhurst

# Workspace Matrix: Arrange workspaces in a grid layout instead of linear
gext install wsmatrix@martin.zurowietz.de

# todo now - at next installation check if it works with <Super> + i
# Invert Window Color: Invert colors of individual windows with a keyboard shortcut
gext install invert-window@maiself

# Emoji Copy: Emoji picker with search and clipboard integration
gext install emoji-copy@felipeftn

# Compile gsettings schemas in order to be able to set them
sudo cp ~/.local/share/gnome-shell/extensions/tactile@lundal.io/schemas/org.gnome.shell.extensions.tactile.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/just-perfection-desktop\@just-perfection/schemas/org.gnome.shell.extensions.just-perfection.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/blur-my-shell\@aunetx/schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/tophat@fflewddur.github.io/schemas/org.gnome.shell.extensions.tophat.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/AlphabeticalAppGrid\@stuarthayhurst/schemas/org.gnome.shell.extensions.AlphabeticalAppGrid.gschema.xml /usr/share/glib-2.0/schemas/
sudo cp ~/.local/share/gnome-shell/extensions/wsmatrix\@martin.zurowietz.de/schemas/org.gnome.shell.extensions.wsmatrix.gschema.xml /usr/share/glib-2.0/schemas/
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

# Don't show recent files in nautilus
gsettings set org.gnome.desktop.privacy remember-recent-files false

# Configure Tactile
gsettings set org.gnome.shell.extensions.tactile col-0 1
gsettings set org.gnome.shell.extensions.tactile col-1 2
gsettings set org.gnome.shell.extensions.tactile col-2 1
gsettings set org.gnome.shell.extensions.tactile col-3 0
gsettings set org.gnome.shell.extensions.tactile row-0 1
gsettings set org.gnome.shell.extensions.tactile row-1 1
gsettings set org.gnome.shell.extensions.tactile gap-size 32

# Configure Just Perfection
gsettings set org.gnome.shell.extensions.just-perfection animation 2
gsettings set org.gnome.shell.extensions.just-perfection dash-app-running true
gsettings set org.gnome.shell.extensions.just-perfection workspace-popup false
gsettings set org.gnome.shell.extensions.just-perfection activities-button false
gsettings set org.gnome.shell.extensions.just-perfection accessibility-menu false
# Value 0 = desktop, 1 = overview.
gsettings set org.gnome.shell.extensions.just-perfection startup-status 0
gsettings set org.gnome.shell.extensions.just-perfection window-maximized-on-create true

# Configure Blur My Shell
gsettings set org.gnome.shell.extensions.blur-my-shell.appfolder blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.lockscreen blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.screenshot blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.window-list blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.panel blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.overview blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.overview pipeline 'pipeline_default'
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock brightness 0.6
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock sigma 30
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock static-blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock style-dash-to-dock 0

# Configure TopHat
gsettings set org.gnome.shell.extensions.tophat show-icons false
gsettings set org.gnome.shell.extensions.tophat show-cpu false
gsettings set org.gnome.shell.extensions.tophat show-disk false
gsettings set org.gnome.shell.extensions.tophat show-mem false
gsettings set org.gnome.shell.extensions.tophat show-fs false
gsettings set org.gnome.shell.extensions.tophat network-usage-unit bits

# Configure AlphabeticalAppGrid
gsettings set org.gnome.shell.extensions.alphabetical-app-grid folder-order-position 'end'

# Configure Workspace Matrix
gsettings set org.gnome.shell.extensions.wsmatrix-settings num-columns 6
gsettings set org.gnome.shell.extensions.wsmatrix-settings num-rows 5

# configure top bar to have icons (e.g. Clementine)
gnome-extensions enable ubuntu-appindicators@ubuntu.com
