#!/bin/bash

# use cloudflare dns config to block malware and adult content
RESOLVED_CONF="/etc/systemd/resolved.conf"
DNS_LINE="DNS=1.1.1.3#one.one.one.one"
TLS_LINE="DNSOverTLS=yes"

if ! grep -q "$DNS_LINE" "$RESOLVED_CONF"; then
  echo "$DNS_LINE" | sudo tee -a "$RESOLVED_CONF" > /dev/null
  echo "$TLS_LINE" | sudo tee -a "$RESOLVED_CONF" > /dev/null
  sudo systemctl restart systemd-resolved
  sudo systemctl daemon-reload
fi

