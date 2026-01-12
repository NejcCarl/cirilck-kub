#!/bin/bash

# Run desktop installers
for installer in ~/.local/share/cirilck-kub/install/desktop/*.sh; do source $installer; done
for installer in ~/.local/share/cirilck-kub/install/desktop/cirilck/*.sh; do source $installer; done

# Logout to pickup changes
gum confirm "Ready to reboot for all settings to take effect?" && sudo reboot || true
