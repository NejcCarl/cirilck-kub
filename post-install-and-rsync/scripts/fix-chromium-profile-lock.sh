#!/bin/bash
# Fix Chromium profile lock after restoring home directory
# Removes stale lock files that prevent Chromium from starting

set -e

# Snap Chromium profile location
SNAP_PROFILE="$HOME/snap/chromium/common/chromium"

# Native Chromium profile location (if installed via apt/deb)
NATIVE_PROFILE="$HOME/.config/chromium"

remove_locks() {
    local profile_dir="$1"
    local name="$2"

    if [[ -d "$profile_dir" ]]; then
        echo "Checking $name profile at: $profile_dir"

        local found=0
        for lock_file in "SingletonLock" "SingletonSocket" "SingletonCookie"; do
            if [[ -e "$profile_dir/$lock_file" ]]; then
                echo "  Removing $lock_file"
                /bin/rm -f "$profile_dir/$lock_file"
                found=1
            fi
        done

        if [[ $found -eq 0 ]]; then
            echo "  No lock files found"
        else
            echo "  Lock files removed"
        fi
    else
        echo "$name profile not found at: $profile_dir"
    fi
}

echo "Fixing Chromium profile locks..."
echo

# Kill any running Chromium processes first
if pgrep -x chromium > /dev/null 2>&1 || pgrep -x chromium-browser > /dev/null 2>&1; then
    echo "Warning: Chromium is running. Please close it first."
    exit 1
fi

remove_locks "$SNAP_PROFILE" "Snap Chromium"
echo
remove_locks "$NATIVE_PROFILE" "Native Chromium"

echo
echo "Done. You can now start Chromium."
