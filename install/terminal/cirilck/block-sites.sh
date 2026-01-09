#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOSTS_SOURCE="$SCRIPT_DIR/hosts"
HOSTS_TARGET="/etc/hosts"

if [[ ! -f "$HOSTS_SOURCE" ]]; then
  echo "Error: $HOSTS_SOURCE not found"
  exit 1
fi

sudo cp "$HOSTS_SOURCE" "$HOSTS_TARGET"
