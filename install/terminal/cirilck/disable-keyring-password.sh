#!/bin/bash

# Auto-unlock GNOME Keyring on login by setting empty password
# The keyring will unlock automatically every session without prompting

KEYRING_DIR="$HOME/.local/share/keyrings"

if [ -d "$KEYRING_DIR" ] && [ "$(ls -A "$KEYRING_DIR" 2>/dev/null)" ]; then
    echo "Backing up existing keyrings to $KEYRING_DIR.backup"
    rm -rf "$KEYRING_DIR.backup"
    mv "$KEYRING_DIR" "$KEYRING_DIR.backup"
fi

mkdir -p "$KEYRING_DIR"

# Kill existing keyring daemon
killall gnome-keyring-daemon 2>/dev/null

# Start keyring daemon with empty password - this creates an unlocked keyring
echo -n "" | gnome-keyring-daemon --replace --unlock --components=secrets,pkcs11

echo "Keyring configured with empty password - it will auto-unlock on every login."
