#!/bin/bash

# GNOME Terminal Configuration Script - Complete Customizable Version

# ===== CONFIGURATION VARIABLES =====
# Font settings
FONT_NAME="Ubuntu Mono 16"
USE_SYSTEM_FONT=false

# Color settings
BACKGROUND_COLOR="rgb(0,0,0)"
FOREGROUND_COLOR="rgb(255,255,255)"
USE_THEME_COLORS=false

# Transparency
USE_TRANSPARENCY=true
TRANSPARENCY_PERCENT=0

# Cursor settings
CURSOR_SHAPE="block"        # Options: block, ibeam, underline
CURSOR_BLINK="on"           # Options: on, off, system

# Terminal size (rows and columns)
TERMINAL_ROWS=250
TERMINAL_COLUMNS=250

# Scrolling settings
SCROLLBACK_LINES=5000
SCROLLBACK_UNLIMITED=false
SCROLL_ON_OUTPUT=false
SCROLL_ON_KEYSTROKE=true

# Bell settings
AUDIBLE_BELL=false
VISIBLE_BELL=true

# Text selection
COPY_SELECTION=true

# Window settings
SHOW_MENUBAR=false
THEME_VARIANT="dark"        # Options: dark, light, system
CONFIRM_CLOSE=true

# ===== SCRIPT EXECUTION =====
echo "Applying comprehensive GNOME Terminal configuration..."

# Get default profile
PROFILE=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")
PROFILE_PATH="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE/"

echo "Configuring profile: $PROFILE"

# Font settings
echo "- Setting font configuration..."
gsettings set $PROFILE_PATH font "$FONT_NAME"
gsettings set $PROFILE_PATH use-system-font $USE_SYSTEM_FONT

# Color settings
echo "- Setting color scheme..."
gsettings set $PROFILE_PATH background-color "$BACKGROUND_COLOR"
gsettings set $PROFILE_PATH foreground-color "$FOREGROUND_COLOR"
gsettings set $PROFILE_PATH use-theme-colors $USE_THEME_COLORS

# Transparency settings
echo "- Setting transparency..."
gsettings set $PROFILE_PATH use-transparent-background $USE_TRANSPARENCY
gsettings set $PROFILE_PATH background-transparency-percent $TRANSPARENCY_PERCENT

# Cursor settings
echo "- Setting cursor options..."
gsettings set $PROFILE_PATH cursor-shape "$CURSOR_SHAPE"
gsettings set $PROFILE_PATH cursor-blink-mode "$CURSOR_BLINK"

# Terminal size
echo "- Setting terminal size..."
gsettings set $PROFILE_PATH default-size-columns $TERMINAL_COLUMNS
gsettings set $PROFILE_PATH default-size-rows $TERMINAL_ROWS

# Scrolling settings
echo "- Setting scrolling options..."
gsettings set $PROFILE_PATH scrollback-lines $SCROLLBACK_LINES
gsettings set $PROFILE_PATH scrollback-unlimited $SCROLLBACK_UNLIMITED
gsettings set $PROFILE_PATH scroll-on-output $SCROLL_ON_OUTPUT
gsettings set $PROFILE_PATH scroll-on-keystroke $SCROLL_ON_KEYSTROKE

# Bell settings
echo "- Setting bell options..."
gsettings set $PROFILE_PATH audible-bell $AUDIBLE_BELL
gsettings set $PROFILE_PATH visible-bell $VISIBLE_BELL

# Text selection
echo "- Setting text selection..."
gsettings set $PROFILE_PATH copy-selection $COPY_SELECTION

# Global terminal settings
echo "- Setting global terminal options..."
gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar $SHOW_MENUBAR
gsettings set org.gnome.Terminal.Legacy.Settings theme-variant "$THEME_VARIANT"
gsettings set org.gnome.Terminal.Legacy.Settings confirm-close $CONFIRM_CLOSE

echo ""
echo "================================"
echo "GNOME Terminal configuration completed successfully!"
echo "================================"
echo "Settings applied:"
echo "- Font: $FONT_NAME"
echo "- Colors: $FOREGROUND_COLOR on $BACKGROUND_COLOR"
echo "- Terminal size: ${TERMINAL_COLUMNS}x${TERMINAL_ROWS}"
echo "- Transparency: $TRANSPARENCY_PERCENT%"
echo "- Scrollback: $SCROLLBACK_LINES lines"
echo ""
echo "You may need to restart the terminal or open a new tab to see all changes."
